
# long form data to be able to have running count of active years
unravel_data <- function(gage_data = "data/active_flow_gages_summary_wy.rds"){
  
  gage.data <- readRDS(gage_data)
  
  # reshape dat for plotting
  gage_melt<-gage.data %>%
    unnest(which_years_active)%>%
    unnest(gap_years)%>%
    melt(id.vars=c('site','n_years_active','earliest_active_year', 'any_gaps'), value.name='year', variable.name='activity')%>%
    filter(!is.na(year), year >= 1889) %>% # don't count years prior to 1889 in age - makes n_years_active incorrect for these sites
    mutate(earliest_active_year = ifelse(earliest_active_year <= 1889, 1889, earliest_active_year)) %>% # earliest year possible = 1889
    distinct(site, earliest_active_year, activity, year)%>%
    group_by(site)%>%
    arrange(year)%>%
    mutate(activity = recode(activity, 'which_years_active' = 1, 'gap_years' = 0),
           years_cum=cumsum(activity))%>% # count cumulative years active for eahc site
    transform(year=as.numeric(year))
  # warning produced = inactive years contain ranges. desn't affect age calc, ignoring for now
  return(gage_melt)
  
  font_add_google(name = 'Open Sans', family = 'open-sans')
  
}