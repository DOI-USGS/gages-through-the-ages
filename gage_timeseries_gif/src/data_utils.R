
time_data <- function(gage_data){
  
  # reshape data for plotting
  gage_data |>
    unnest(which_years_active) |>
    dplyr::select(-gap_years) |>
    # expand by years active
    pivot_longer(c(which_years_active), values_to = 'year', names_to = 'activity') |>
    # cut off at 1889
    filter(!is.na(year), year >= 1889, activity == 'which_years_active') |>
    dplyr::select(-activity) |>
    # calculate the age at each year for age graph
    dplyr::mutate(years_since_active = year - earliest_active_year)

}
