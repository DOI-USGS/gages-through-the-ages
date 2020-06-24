
process_digitized_urban_extent <- function(target_name, digitized_shp_fn, proj_str = "+proj=longlat +datum=WGS84 +no_defs") {
  st_read(digitized_shp_fn) %>% 
    st_transform(crs = proj_str) %>% 
    select(geometry) %>% 
    geojson_write( file = target_name)
}

process_modern_urban_extent <- function(target_name, urban_extent_shp_fn, state_nm, proj_str) {
  state_sf <- st_as_sf(maps::map("state", state_nm, plot = FALSE, fill = TRUE)) %>% 
    st_transform(crs = proj_str) %>%
    st_make_valid() %>% 
    select(-ID)
  
  urban_areas <- st_read(urban_extent_shp_fn) %>% 
    st_transform(crs = proj_str) %>% 
    select(geometry)
  
  urban_areas_state <- st_intersection(urban_areas, state_sf)
  geojson_write(urban_areas_state, file = target_name)
}

combine_urban_extents <- function(target_name, ...) {
  purrr::map(list(...), function(fn) {
    st_read(fn)
  }) %>% 
    purrr::reduce(st_union) %>% 
    geojson_write(file = target_name)
}

filter_sites_to_view <- function(site_location_sf, proj_str, ...) {
  
  view_sf <- purrr::map(list(...), function(bbox_vec) {
    # Expecting bbox_vec to be c(xmin, ymin, xmax, ymax)
    names(bbox_vec) <- c("xmin", "ymin", "xmax", "ymax")
    
    # Create 4 corners of view box
    bbox <- data.frame(
      lat = c(bbox_vec[["ymin"]], bbox_vec[["ymax"]], bbox_vec[["ymax"]], bbox_vec[["ymin"]]),
      long = c(bbox_vec[["xmin"]], bbox_vec[["xmin"]], bbox_vec[["xmax"]], bbox_vec[["xmax"]]))
    
    # Take bbox coordinates and convert into rectangle
    st_as_sf(bbox, coords = c("long", "lat"), crs = "+proj=longlat +datum=WGS84") %>% 
      st_transform(crs = proj_str) %>% 
      st_combine() %>% 
      st_cast("POLYGON")
  }) %>% 
    purrr::reduce(st_union)
  
  st_intersection(site_location_sf, view_sf)
}

find_urban_sites <- function(gages_sf, urban_extents_geojson) {
  
  urban_extents_sf <- st_read(urban_extents_geojson) %>% 
    st_make_valid() 
  
  stopifnot(st_crs(gages_sf) == st_crs(urban_extents_sf))
  
  urban_gages_sf <- st_join(urban_extents_sf, gages_sf, join = st_intersects) %>% unique()
  
  # Now return just unique site numbers
  st_drop_geometry(urban_gages_sf) %>%
    filter(!is.na(site_no)) %>% 
    pull(site_no) %>% 
    unique()
}

process_urban_sites <- function(target_name, gages_sf, urban_gages, file.out = TRUE) {
  # Add attribute for whether a gage is in an urban area or not
  sites_sf_classified <- gages_sf %>% 
    mutate(is_urban = site_no %in% urban_gages)
  if(file.out) {
    geojson_write(sites_sf_classified, file = target_name)
    return()
  } else {
    return(sites_sf_classified)
  }
}

calc_perc_urban <- function(target_name, past_urban_gages, present_urban_gages) {
  
  past_perc_urban <- sum(past_urban_gages$is_urban) / nrow(past_urban_gages) * 100
  present_perc_urban <- sum(present_urban_gages$is_urban) / nrow(present_urban_gages) * 100
  
  saveRDS(tibble(`Percent Urban Past` = past_perc_urban, 
                 `Percent Urban Present` = present_perc_urban),
          target_name)
}
