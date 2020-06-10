# Ported this `sp` version over from the existing code & updated to not 
# be so vizlab-y. Would like to switch to `sf` at some point (the start
# of which is here: https://github.com/USGS-VIZLAB/viz-scratch/pull/54)

generate_oconus_sp <- function(proj_str) {
  list(AK = to_sp("world", "USA:alaska", proj.string = proj_str),
       HI = to_sp("world", "USA:hawaii", proj.string = proj_str),
       PR = to_sp("world", "Puerto Rico", proj.string = proj_str))
}

generate_oconus_shifts <- function() {
  list(AK = list(scale = 0.37, shift = c(90,-460), rotate = -50),
       HI = list(scale = 1, shift = c(520, -110), rotate = -35),
       PR = list(scale = 2.5, shift = c(-140, 90), rotate=20))
}

generate_usa_map <- function(proj_str){
  states_out <- to_sp('state', proj.string = proj_str)
  
  shifts <- generate_oconus_shifts()
  stuff_to_move <- generate_oconus_sp(proj_str)
  
  for(i in names(shifts)){
    shifted <- do.call(shift_sp, c(sp = stuff_to_move[[i]], 
                                   shifts[[i]],  
                                   proj.string = proj4string(states_out),
                                   row.names = i))
    states_out <- rbind(shifted, states_out, makeUniqueIDs = TRUE)
  }
  return(states_out)
}

process_site_map_sp <- function(target_name, site_data_file, proj_str){
  
  sites <- readRDS(site_data_file) %>% filter(!is.na(dec_lat_va))
  
  # Shifting AK, HI, PR into view
  # Don't do this shifting if projection is mercator
  if(proj_str != "+proj=longlat +datum=WGS84") {
    huc.map <- c(AK = "19", HI = "20", PR = "21")
    shifts <- generate_oconus_shifts()
    stuff_to_move <- generate_oconus_sp(proj_str)
    
    sites.out <- sites %>% filter(!huc %in% huc.map) %>% points_sp(proj_str)
    for (region in names(huc.map)){
      sites.tmp <- sites %>% filter(huc %in% huc.map[[region]]) %>% points_sp(proj_str)
      sites.tmp <- do.call(
        shift_sp, c(sp = sites.tmp, ref = stuff_to_move[[region]], 
                    proj.string = proj_str, shifts[[region]])
      )
      sites.out <- rbind(sites.out, sites.tmp)
    }
  } else {
    sites.out <- sites %>% points_sp(proj_str)
  }

  saveRDS(sites.out, file = target_name)
}

to_sp <- function(..., proj.string){
  map <- maps::map(..., fill=TRUE, plot = FALSE)
  IDs <- sapply(strsplit(map$names, ":"), function(x) x[1])
  map.sp <- map2SpatialPolygons(map, IDs=IDs, proj4string=CRS("+proj=longlat +datum=WGS84"))
  map.sp.t <- spTransform(map.sp, CRS(proj.string))
  return(map.sp.t)
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

points_sp <- function(locations, proj.string){
  cbind(locations$dec_long_va, locations$dec_lat_va) %>% 
    sp::SpatialPoints(proj4string = CRS("+proj=longlat +datum=WGS84")) %>% 
    sp::spTransform(CRS(proj.string)) %>% 
    sp::SpatialPointsDataFrame(data = locations[c('site_no')])
}

process_site_sf <- function(site_location_data, proj_str) {
  site_location_data %>% 
    filter(!is.na(dec_lat_va)) %>% 
    st_as_sf(coords = c("dec_long_va", "dec_lat_va"), crs = "+proj=longlat +datum=WGS84") %>% 
    st_transform(crs = proj_str) %>% 
    lwgeom::st_make_valid() 
}
