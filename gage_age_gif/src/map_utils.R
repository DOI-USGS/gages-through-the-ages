#' take map arguments and return a projected sp object
#' 
#' @param \dots arguments passed to \code{\link[maps]{map}} excluding \code{fill} and \code{plot}
#' 

proj.string <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"
to_sp <- function(...){
  library(maptools)
  library(maps)
  map <- maps::map(..., fill=TRUE, plot = FALSE)
  IDs <- sapply(strsplit(map$names, ":"), function(x) x[1])
  map.sp <- map2SpatialPolygons(map, IDs=IDs, proj4string=CRS("+proj=longlat +datum=WGS84"))
  map.sp.t <- spTransform(map.sp, CRS(proj.string))
  return(map.sp.t)
}

#' @param locations a data.frame with dec_long_va and dec_lat_va
points_sp <- function(locations){
  library(dplyr)
  
  points <- cbind(locations$dec_long_va, locations$dec_lat_va) %>% 
    sp::SpatialPoints(proj4string = CRS("+proj=longlat +datum=WGS84")) %>% 
    sp::spTransform(CRS(proj.string)) %>% 
    sp::SpatialPointsDataFrame(data = locations[c('site_no')])
}


#' create the sp object 
#'
fetch_state_map <- function(...){
  shift_details <- list(...)
  
  state_map <- to_sp('state')
  for(i in 1:length(shift_details)){
    
    this_sp <- to_sp("world", shift_details[[i]]$regions)
    these_shifts <- shift_details[[i]][c('scale','shift','rotate')]
    shifted <- do.call(shift_sp, c(sp = this_sp,
                                   these_shifts,  
                                   proj.string = proj4string(state_map),
                                   row.names = shift_details[[i]]$regions))
    state_map <- rbind(shifted, state_map, makeUniqueIDs = TRUE)
  }
  
  return(state_map)
}

shift_sites <- function(..., gage_data){
  huc_map <- c(AK = "19", HI = "20", PR = "21")
  
  shift_details <- list(...)
  
  gages_info <- readRDS(gage_data) %>%
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
    filter(dec_long_va < -65.4)  # remove US virgin Islands and other things we won't plot
  
  
  sites_out <- gages_info %>% filter(!huc %in% huc_map) %>% 
    points_sp()
  
  for(i in 1:length(shift_details)){
    region <- shift_details[[i]]$abrv
    
    sites_tmp <- gages_info %>% filter(huc == huc_map[[region]]) %>% 
      points_sp()
    
    sites_out <- do.call(shift_sp, c(sp = sites_tmp, 
                                     ref = to_sp("world", shift_details[[i]]$regions), 
                                     shift_details[[i]][c('scale','shift','rotate')])) %>% 
      rbind(sites_out, .)
  }

  return(sites_out)
}


shift_sp <- function(sp, scale = NULL, shift = NULL, rotate = 0, ref=sp, proj.string=NULL, row.names=NULL){
  if (is.null(scale) & is.null(shift) & rotate == 0){
    return(obj)
  }
  orig.cent <- rgeos::gCentroid(ref, byid=TRUE)@coords
  scale <- max(apply(bbox(ref), 1, diff)) * scale
  obj <- elide(sp, rotate=rotate, center=orig.cent, bb = bbox(ref))
  ref <- elide(ref, rotate=rotate, center=orig.cent, bb = bbox(ref))
  obj <- elide(obj, scale=scale, center=orig.cent, bb = bbox(ref))
  ref <- elide(ref, scale=scale, center=orig.cent, bb = bbox(ref))
  new.cent <- rgeos::gCentroid(ref, byid=TRUE)@coords
  obj <- elide(obj, shift=shift*10000+c(orig.cent-new.cent))
  if (is.null(proj.string)){
    proj4string(obj) <- proj4string(sp)
  } else {
    proj4string(obj) <- proj.string
  }
  
  if (!is.null(row.names)){
    row.names(obj) <- row.names
  }
  return(obj)
}
