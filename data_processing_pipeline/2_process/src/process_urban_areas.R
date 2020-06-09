
process_digitized_urban_extent <- function(target_name, digitized_shp_fn, proj_str = "+proj=longlat +datum=WGS84 +no_defs") {
  st_read(digitized_shp_fn) %>% 
    st_transform(crs = proj_str) %>% 
    select(geometry) %>% 
    geojson_write( file = target_name)
}

process_modern_urban_extent <- function(target_name, urban_extent_shp_fn, state_nm) {
  state_sf <- st_as_sf(map("state", state_nm, plot = FALSE, fill = TRUE)) %>% 
    lwgeom::st_make_valid() %>% 
    select(-ID)
  
  urban_areas <- st_read(urban_extent_shp_fn) %>% 
    st_transform(crs = "+proj=longlat +datum=WGS84 +no_defs") %>% 
    select(geometry)
  
  urban_areas_state <- st_intersection(urban_areas, state_sf)
  geojson_write(urban_areas_state, file = target_name)
}
