
time_data <- function(gage_data){
  
  # reshape data for plotting
  gage_data |>
    unnest(which_years_active) |>
    unnest(gap_years) |>
    dplyr::select(-n_years_active, -earliest_active_year) |>
    transform(gap_years = as.numeric(gap_years)) |>
    pivot_longer(c(which_years_active, gap_years), values_to = 'year', names_to = 'activity') |>
    filter(!is.na(year), year >= 1889, activity == 'which_years_active')

}
