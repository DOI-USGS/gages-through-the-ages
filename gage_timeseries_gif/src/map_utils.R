
#' take map locations and return a projected sf object
#' 
#' @param locations coordinates of the spatial points for mapping
#' 
points_sp <- function(locations, crs_out){
  sf::st_as_sf(
    locations,
    coords = c("dec_long_va", "dec_lat_va"),
    crs = 4326  # WGS84
  ) #|>
    #sf::st_transform(crs = crs_out)
}


#' take map arguments and return a projected sf object
#' 
#' @param area_name name of the spatial extent for mapping
#' 
extract_states <- function(area_name){

  # projection code look up for non-CONUS regions
  crs_map <- c(AK = 3338, HI = 6633, PR = 4139)
  
  if(area_name == "CONUS") {
    state_map <- tigris::states(cb = TRUE) |>
      filter(!(STUSPS %in% c('AS', 'MP','GU', 'VI', 'HI', 'PR', 'AK'))) |>
      sf::st_transform(crs = 5070) 
  } else {
    state_map <- tigris::states(cb = TRUE) |>
      filter(STUSPS == area_name) |>
      sf::st_transform(crs = crs_map[area_name]) 
  }
  
  return(state_map)
}

#' Use gage sites to get metadata on locations
#' 
#' @param gage_data data frame of gages read from .rds file
#' 
fetch_gage_info <- function(gage_data){
  site_ids <- gage_data |>
    pull(site) |>
    unique()
  
  # need to chunk sites to pull info from dataRetrieval
  site_chunks <- split(site_ids, ceiling(seq_along(site_ids) / 100))
  
  gages_info <- site_chunks |>
    map_dfr(possibly(readNWISsite, otherwise = NULL)) |>
    group_by(site_no) |>
    summarize(
      huc = stringr::str_sub(tail(unique(huc_cd), 1), 1L, 2L),
      dec_lat_va = mean(dec_lat_va, na.rm = TRUE),
      dec_long_va = mean(dec_long_va, na.rm = TRUE),
      .groups = "drop"
    ) |> 
    filter(dec_long_va < -65.4,
           dec_lat_va > 0)  # remove US virgin Islands and other things we won't plot
  
}

#' take map arguments and return a projected sf object
#' 
#' @param area_name name of the spatial extent for mapping
#' @param gage_info the metadata including locations for gages
#' 
extract_sites <- function(area_name, gage_info){
  
  # huc look up for non-CONUS regions
  huc_map <- c(AK = "19", HI = "20", PR = "21")
  
  # projection code look up for non-CONUS regions
  crs_map <- c(AK = 3338, HI = 6633, PR = 4139)
  
  if(area_name == "CONUS") {
    
    sites_out <- gage_info |> 
      filter(!huc %in% huc_map) |> 
      filter(!is.na(dec_lat_va), !is.na(dec_long_va)) |>  # exclude NA coordinates
      points_sp() |>
      sf::st_as_sf() |>
      sf::st_transform(crs = 5070)
    
  } else if(area_name != "CONUS") {
    
    sites_out <- gage_info |> 
      filter(huc == huc_map[[area_name]]) |>
      points_sp() |>
      sf::st_as_sf() |>
      sf::st_transform(crs = crs_map[[area_name]])
  }
  
  return(sites_out)
}

#' 
#' Bind all sites together, reprojecting them to ortho/global projection
#' 
#' @param in_CONUS sf object with sites in CONUS
#' @param in_HI sf object with sites in Hawaii
#' @param in_PR sf object with sites in PR
#' @param in_AK sf object with sites in Alaska
#' @param crs the ortho projection as string
#' 
harmonize_sites <- function(in_CONUS, in_HI, in_PR, in_AK, crs){
  
  temp_conus <- in_CONUS |>
    sf::st_transform(crs = crs) |>
    mutate(location = "CONUS")
  
  temp_AK <- in_AK |>
    sf::st_transform(crs = crs) |>
    mutate(location = "AK")
  
  temp_HI <- in_HI |>
    sf::st_transform(crs = crs) |>
    mutate(location = "HI")
  
  temp_PR <- in_PR |>
    sf::st_transform(crs = crs) |>
    mutate(location = "PR")
  
  out_sf <- bind_rows(temp_conus, temp_AK, temp_HI, temp_PR)
  
  return(out_sf)
}
