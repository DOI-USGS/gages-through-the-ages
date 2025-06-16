
#' take map locations and return a projected sf object
#' 
#' @param locations coordinates of the spatial points for mapping
#' 
points_sp <- function(locations){
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

#' Use gage sites to get metadata on locations
#' 
#' @param gage_data data frame of gages read from .rds file
#' 
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


