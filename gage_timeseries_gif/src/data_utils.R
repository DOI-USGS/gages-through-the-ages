
time_data <- function(gage_data = "data/active_flow_gages_summary_wy.rds"){
  gage_data <- readRDS("data/active_flow_gages_summary_wy.rds")
  
  # reshape data for plotting
  gage_melt <- gage_data |>
    unnest(which_years_active) |>
    unnest(gap_years) |>
    melt(id.vars=c('site','n_years_active','earliest_active_year', 'any_gaps'), 
         value.name='year', variable.name='activity') |>
    filter(!is.na(year), year >= 1889, activity == 'which_years_active') |>
    select(-n_years_active, -earliest_active_year, -activity, -any_gaps) |>
    transform(year = as.numeric(year))
  
  return(gage_melt)
}
