#' take map arguments and return a projected sp object
#' 
#' @param \dots arguments passed to \code{\link[maps]{map}} excluding \code{fill} and \code{plot}
#' 

to_sp <- function(area_name){
  map <- maps::map(area_name, fill = TRUE, plot = FALSE)
  IDs <- sapply(strsplit(map$names, ":"), function(x) x[1])
  map.sp <- sf::st_as_sf(map)
  map.sp.t <- sf::st_transform(x = map.sp, CRSobj = sp::CRS("+proj=longlat +datum=WGS84"))
  return(map.sp.t)
}

#' @param locations a data.frame with dec_long_va and dec_lat_va
points_sp <- function(locations){
  points <- cbind(locations$dec_long_va, locations$dec_lat_va) 
  points_sp <- sp::SpatialPoints(points, sp::CRS("+proj=longlat +datum=WGS84")) 
  points_transform <- sp::spTransform(points_sp, proj.string) %>% 
    sp::SpatialPointsDataFrame(data = locations[c('site_no')])
  return(points_transform)
}


#' create the sp object 
#'
extract_states <- function(area_name){

  # projection code look up for non-CONUS regions
  crs_map <- c(AK = 3338, HI = 6633, PR = 4139)
  
  if(area_name == "CONUS") {
    state_map <- tigris::states(cb = TRUE) %>%
      filter(!(STUSPS %in% c('AS', 'MP','GU', 'VI', 'HI', 'PR', 'AK'))) %>%
      sf::st_transform(crs = 5070) 
  } else {
    state_map <- tigris::states(cb = TRUE) %>%
      filter(STUSPS == area_name) %>%
      sf::st_transform(crs = crs_map[area_name]) 
  }
  
  return(state_map)
}

fetch_gage_info <- function(gage_data){
  gages_info <- gage_data %>%
    pull(site) %>% 
    dataRetrieval::readNWISsite() %>% 
    group_by(site_no) %>% 
    # parse huc_cd to 2 digits, and rename to huc to stay consistent
    # 3/19/2020 - discovered that some sites have more than one HUC code, not sure how that
    # is possible, but filtering to the last one (most recent) for now
    #   E.g. site number `11434500` had huc_cd=="18020129" for year == 2014 and then 
    #     huc_cd `16050101` for year == 2016
    summarize(huc = stringr::str_sub(tail(unique(huc_cd),1), 1L, 2L), 
              # huc = paste(stringr::str_sub(unique(huc_cd)[[1]], 1L, 2L), collapse = "|"),
              dec_lat_va = mean(dec_lat_va), dec_long_va = mean(dec_long_va)) %>% 
    filter(dec_long_va < -65.4,
           dec_lat_va > 0)  # remove US virgin Islands and other things we won't plot
  
}

extract_sites <- function(area_name, gage_info){
  
  # huc look up for non-CONUS regions
  huc_map <- c(AK = "19", HI = "20", PR = "21")
  
  # projection code look up for non-CONUS regions
  crs_map <- c(AK = 3338, HI = 6633, PR = 4139)
  
  if(area_name == "CONUS") {
    
    sites_out <- gage_info %>% 
      filter(!huc %in% huc_map) %>% 
      points_sp() |>
      sf::st_as_sf() |>
      sf::st_transform(crs = 5070)
    
  } else if(area_name != "CONUS") {
    
    sites_out <- gage_info %>% 
      filter(huc == huc_map[[area_name]]) |>
      points_sp() |>
      sf::st_as_sf() |>
      sf::st_transform(crs = crs_map[[area_name]])
  }
  
  return(sites_out)
}


shift_sp <- function(sp, 
                     scale = NULL, 
                     shift = NULL, 
                     rotate = 0, 
                     ref = sp, 
                     proj.string = NULL, 
                     row.names = NULL){
  if (is.null(scale) & is.null(shift) & rotate == 0){
    return(obj)
  }
  #orig.cent <- rgeos::gCentroid(ref, byid = TRUE)@coords
  orig.cent <- sf::st_coordinates(sf::st_centroid(ref))
  bbox <- unname(sf::st_bbox(ref))
  scale <- max(diff(bbox)) * scale
  sp_obj <- as(sp, "Spatial")
  obj <- sp::elide(obj = sp_obj, rotate = rotate, center = orig.cent)
  ref <- sp::elide(obj = sp_obj, rotate = rotate, center = orig.cent)
  obj <- sp::elide(obj, scale = scale, center = orig.cent)
  ref <- sp::elide(ref, scale = scale, center = orig.cent)
  new.cent <- sf::st_coordinates(sf::st_centroid(sf::st_as_sf(ref)))
  final_obj <- sp::elide(obj, shift = shift * 10000 + c(orig.cent - new.cent))
  if (is.null(proj.string)){
    sp::proj4string(final_obj) <- sp::proj4string(sp_obj)
  } else {
    sp::proj4string(final_obj) <- proj.string
  }
  
  if (!is.null(row.names)){
    row.names(obj) <- row.names
  }
  return(obj)
}
