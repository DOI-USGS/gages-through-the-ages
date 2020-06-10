
process_filter_gages_data_to_year_range <- function(target_name, gages_data_file, year_range) {
  readRDS(gages_data_file) %>% 
    filter(year >= year_range[1], year <= year_range[2]) %>% 
    saveRDS(target_name)
}

process_filter_gages_summary_to_year_range <- function(target_name, gages_data_file, year_range) {
  # Filter out any sites that only have data less than the minimum year
  active_gages_info <- readRDS(gages_data_file)
  active_gages_info$which_years_active <- purrr::map(active_gages_info$which_years_active, function(yrs) {
    years_out <- yrs[yrs >= year_range[1] & yrs <= year_range[2]]
    if(length(years_out) < 1) years_out <- NA
    return(years_out)
  })
  
  active_gages_info %>% 
    filter(!is.na(which_years_active)) %>% 
    saveRDS(target_name)
}

process_site_info <- function(target_name, active_gages_data_file){
  readRDS(active_gages_data_file) %>%
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
    filter(dec_long_va < -65.4) %>% # remove US virgin Islands and other things we won't plot
    saveRDS(target_name)
}

process_year_json <- function(target_name, gage_locations_file, gage_year_data_file, 
                              site_chunk_n, site_chunk_nm_pattern){
  sites_sp <- readRDS(gage_locations_file)
  sites <- sites_sp@data$site_no
  year_info <- readRDS(gage_year_data_file)
  year_info <- year_info %>% mutate(site_ids_prev_year = lag(site_ids_per_year))
  
  # Chunk sites into groups of site_chunk_n
  chunk_s <- seq(1, by=site_chunk_n, to=length(sites))
  chunk_e <- c(tail(chunk_s, -1L), length(sites))
  
  gained_loss_out <- purrr::pmap(tibble(chunk_s, chunk_e, i = seq_along(chunk_s)), function(chunk_s, chunk_e, i) {
    sites_chunk <- sites[chunk_s:chunk_e]
    
    chunk_gain_loss <- purrr::pmap(year_info, function(year, n_gages_per_year, site_ids_per_year, site_ids_prev_year){
      now_i <- which(sites_chunk %in% site_ids_per_year)
      if (is.null(site_ids_prev_year)){
        yr_gain_loss <- list(list(gn = now_i, ls = numeric()))
      } else {
        last_i <- which(sites_chunk %in% site_ids_prev_year)
        gained <- now_i[!now_i %in% last_i]
        lost <- last_i[!last_i %in% now_i]
        yr_gain_loss <- list(list(gn = gained, ls = lost))
      }
      
      names(yr_gain_loss) <- year
      return(yr_gain_loss)
    }) %>% 
      purrr::reduce(append) %>% 
      list()
    
    names(chunk_gain_loss) <- sprintf(site_chunk_nm_pattern, i)
    return(chunk_gain_loss)
  }) %>% 
    purrr::reduce(append) 
  
  cat(toJSON(gained_loss_out), file = target_name)
}
