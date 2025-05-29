library(targets)
library(tarchetypes)
library(tidyverse)

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", 
                            "purrr",
                            "dataRetrieval",
                            "raster", 
                            "sf", 
                            "stringr",
                            "maps", 
                            "scico", 
                            "cowplot", 
                            "geomtextpath", 
                            "sp",
                            "magick"))

source('src/data_utils.R')
source('src/plot_utils.R')
source('src/map_utils.R')
source('src/gw_utils.R')

# output configs
font_fam <-'Source Sans Pro'
sysfonts::font_add_google(font_fam, regular.wt = 300, bold.wt = 700)
showtext::showtext_opts(dpi = 300)
showtext::showtext_auto(enable = TRUE)

# years in time series 
years_to_plot <- seq(1889, 2024, by = 1)

# Plotting configs
blue_color <- "#143D60" #11.25:1 contrast on white
grey_dark <- "#61677A" #5.6:1 contrast on white
grey_light <- "#CFD3D3" #1.5:1 contrast on white
teal_color <- "#386785" #6.09:1 contrast on white
teal_dark <- "#41789B"
teal_med <- "#5D97BB"
teal_light <- "#93BAD2"
red_color <- "#78303D"  #9.17:1 contrast on white
lighter_red <- "#9D3F51"  # 6.43:1 contrast on white 
lighter_red2 <- "#BE5B6D"
lighter_red3 <- "#CC7F8D"
# import logo
usgs_logo <- magick::image_read('usgs_logo_grey.png') |>
  magick::image_resize('x80') |>
  magick::image_colorize(100, grey_light)

# projected maps
proj.string <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"
# global map
ortho_crs <- "+proj=ortho +lat_0=40 +lon_0=-100 +x_0=0 +y_0=0 +ellps=WGS84 +no_defs"

p1_fetch_targets <- list(
  # Output of `national-flow-observations`
  tar_target(
    gage_file,
    return("data/active_flow_gages_summary_wy.rds"),
    format = "file"
  ),
  tar_target(
    gage_data,
    readRDS(gage_file)
  ),
  
  # get metadata about all the gages
  tar_target(
    gage_info,
    fetch_gage_info(gage_data = gage_data)
  ),
  
  # Prep states for map layout
  tar_target(
    state_map_CONUS,
    extract_states(area_name = "CONUS")
  ),
  tar_target(
    state_map_AK,
    extract_states(area_name = "AK")
  ),
  tar_target(
    state_map_HI,
    extract_states(area_name = "HI")
  ),
  tar_target(
    state_map_PR,
    extract_states(area_name = "PR")
  ),
  
  # prep globe for global layout
  tar_target(
    world_map_sf,
    rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")
  )
)

p2_process_targets <- list(
  
  # Put in long form with site_no x years active
  tar_target(
    gage_melt,
    time_data(gage_data) 
  ),
  
  # Prep sites for map layout (get location information)
  tar_target(
    site_map_CONUS,
    extract_sites(area_name = "CONUS", 
                  gage_info = gage_info)
  ),
  tar_target(
    site_map_AK,
    extract_sites(area_name = "AK", 
                  gage_info = gage_info)
  ),
  tar_target(
    site_map_HI,
    extract_sites(area_name = "HI", 
                  gage_info = gage_info)
  ),
  tar_target(
    site_map_PR,
    extract_sites(area_name = "PR", 
                  gage_info = gage_info)
  ),
  
  # merge all sites together for global view map
  tar_target(
    sites_all_global,
    harmonize_sites(in_CONUS = site_map_CONUS,
                    in_HI = site_map_HI,
                    in_PR = site_map_PR,
                    in_AK = site_map_AK,
                    crs = ortho_crs)
  )
)

p3_viz_split_targets <- 
  tarchetypes::tar_map(
    # Years 
    values = list(active_year = years_to_plot),
    # Plot bar chart of streamgage age distribution through time
    tar_target(gage_age_list,
               plot_gage_age(gage_melt,
                             yr = active_year, 
                             font_fam)),
    # Plot bar chart of active streamgages through time
    tar_target(gage_bar_list,
               plot_gage_timeseries(gage_melt, 
                                    yr = active_year, 
                                    font_fam)),
    # Map active streamgages through time - for each region
    tar_target(
      gage_map_list_CONUS,
      plot_gage_map(gage_melt = gage_melt, 
                    yr = active_year, 
                    site_map = site_map_CONUS, 
                    state_map = state_map_CONUS)),
    tar_target(
      gage_map_list_AK,
      plot_gage_map(gage_melt = gage_melt, 
                    yr = active_year, 
                    site_map = site_map_AK, 
                    state_map = state_map_AK)),
    tar_target(
      gage_map_list_PR,
      plot_gage_map(gage_melt = gage_melt, 
                    yr = active_year, 
                    site_map = site_map_PR, 
                    state_map = state_map_PR)),
    tar_target(
      gage_map_list_HI,
      plot_gage_map(gage_melt = gage_melt, 
                    yr = active_year, 
                    site_map = site_map_HI, 
                    state_map = state_map_HI)),
    # Plot bar chart and map together 
    tar_target(
      gage_frames,
      compose_chart(bar_chart = gage_bar_list, 
                    age_chart = gage_age_list,
                    gage_map_CONUS = gage_map_list_CONUS,
                    gage_map_AK = gage_map_list_AK,
                    gage_map_HI = gage_map_list_HI,
                    gage_map_PR = gage_map_list_PR, 
                    yr = active_year,
                    png_out = sprintf("out/gage_time_%s.png", active_year),
                    standalone_logic = FALSE,
                    gage_melt = gage_melt),
      format = 'file'),
    names = active_year
  )

p3_viz_combine_targets <- 
  tarchetypes::tar_combine(
    # Create animation 
    gage_gif,
    # specific target from static branching
    p3_viz_split_targets[["gage_frames"]],
    command = animate_frames_gif(!!!.x, 
                                 out_file = 'out/gage_timeseries.gif',
                                 reduce = TRUE, 
                                 frame_delay_cs = 20, 
                                 frame_rate = 4),
    format = 'file'
  )


# pull only one year for standalone viz
#   defaults to latest year
##    https://github.com/ropensci/targets/discussions/324
year_for_plot <- max(years_to_plot)
selected_plot_target <- rlang::syms(sprintf("gage_bar_list_%s", year_for_plot))
selected_age_target <- rlang::syms(sprintf("gage_age_list_%s", year_for_plot))
selected_conus_target <- rlang::syms(sprintf("gage_map_list_CONUS_%s", year_for_plot))
selected_ak_target <- rlang::syms(sprintf("gage_map_list_AK_%s", year_for_plot))
selected_pr_target <- rlang::syms(sprintf("gage_map_list_PR_%s", year_for_plot))
selected_hi_target <- rlang::syms(sprintf("gage_map_list_HI_%s", year_for_plot))

downstream_targets <- list(
  tar_map(
    values = list(plot = selected_plot_target,
                  age_plot = selected_age_target,
                  conus_map = selected_conus_target,
                  ak_map = selected_ak_target,
                  pr_map = selected_pr_target,
                  hi_map = selected_hi_target),
    tar_target(
      standalone_png,
      compose_chart(bar_chart = plot,
                    age_chart = age_plot,
                    gage_map_CONUS = conus_map,
                    gage_map_AK = ak_map,
                    gage_map_PR = pr_map,
                    gage_map_HI = hi_map,
                    yr = year_for_plot,
                    png_out = sprintf("out/standalone_%s.png", year_for_plot),
                    standalone_logic = TRUE,
                    gage_melt = gage_melt
      )
    )
  )
)

# # # # # # # # # # # # # # # # # # # # # # #  
#
# 
#       GLOBAL MAP of STREAMGAGES
# 
#
global_targets <- list(
  tar_target(
    global_png,
    compose_global_map(
      gage_melt = gage_melt,
      sites_in_sf = sites_all_global,
      globe_in_sf = world_map_sf,
      focal_year = year_for_plot,
      crs = ortho_crs,
      png_out = "out/global_gages_map.png"
    ),
    format = "file"
  )
)

# # # # # # # # # # # # # # # # # # # # # # #  
#
# 
#       GROUNDWATER SITE MAP
# 
# 
gw_targets <- list(
  # fetch raw data from dataRetrieval
  tar_target(
    p1_fetch_gw_sites,
    fetch_gw_sites()
  ),
  # Process for plotting
  tar_target(
    p1_fetch_gw_distinct,
    p1_fetch_gw_sites |> 
      filter(stringr::str_detect(string = site_tp_cd, pattern = "GW")) |>
      distinct(site_no, .keep_all = TRUE) |>
      left_join(p1_agency_codes, by = "agency_cd") |>
      mutate(agency_general = case_when(
        grepl("USGS", agency_cd) ~ "USGS",
        grepl("US", agency_cd) ~ "Other Federal",
        TRUE ~ "Non-Federal")) 
  ),
  # Save to csv for collaborators
  tar_target(
    p1_fetch_gw_csv,
    {readr::write_csv(p1_fetch_gw_distinct, 
                      file = "data/groundwater_site_ids.csv")
      return("data/groundwater_site_ids.csv")},
    format = "file"
  ),
  # read agency codes, downloaded from NWIS page March 2025
  tar_target(
    p1_agency_codes,
    readr::read_delim("data/agency_cd_query.txt", delim = '\t',skip = 7)
  ),
  
  # convert sites to spatial
  tar_target(
    p2_gw_sites_sf_CONUS,
    extract_gw_sites(area_name = "CONUS",
                     site_info = p1_fetch_gw_distinct)
  ),
  tar_target(
    p2_gw_sites_sf_AK,
    extract_gw_sites(area_name = "AK",
                     site_info = p1_fetch_gw_distinct)
  ),
  tar_target(
    p2_gw_sites_sf_HI,
    extract_gw_sites(area_name = "HI",
                     site_info = p1_fetch_gw_distinct)
  ),
  # process data for pie charts
  tar_target(
    p2_federal_collaborators,
    process_for_pie(in_df = p1_fetch_gw_distinct,
                    breakdown_type = "federal")
  ),
  tar_target(
    p2_nonfederal_collaborators,
    process_for_pie(in_df = p1_fetch_gw_distinct,
                    breakdown_type = "non-federal")
  ),
  tar_target(
    p2_all_collaborators,
    process_for_pie(in_df = p1_fetch_gw_distinct,
                    breakdown_type = "overview")
  ),
  
  # map mini-maps for each region
  tar_target(
    p3_gw_sitemap_CONUS,
    plot_gw_map(gw_sf = p2_gw_sites_sf_CONUS,
                state_map = state_map_CONUS)
  ),
  tar_target(
    p3_gw_sitemap_HI,
    plot_gw_map(gw_sf = p2_gw_sites_sf_HI,
                state_map = state_map_HI)
  ),
  tar_target(
    p3_gw_sitemap_AK,
    plot_gw_map(gw_sf = p2_gw_sites_sf_AK,
                state_map = state_map_AK)
  ),
  # pie charts
  tar_target(
    p3_federal_pie,
    plot_gw_piechart(in_df = p2_federal_collaborators,
                     breakdown_type = "federal")
  ),
  tar_target(
    p3_nonfederal_pie,
    plot_gw_piechart(in_df = p2_nonfederal_collaborators,
                     breakdown_type = "non-federal")
  ),
  tar_target(
    p3_overview_pie,
    plot_gw_piechart(in_df = p2_all_collaborators,
                     breakdown_type = "overview")
  ),
  
  tar_target(
    p3_gw_map_png,
    compose_gw_chart(gw_map_CONUS = p3_gw_sitemap_CONUS,
                     gw_map_AK = p3_gw_sitemap_AK,
                     gw_map_HI = p3_gw_sitemap_HI,
                     pie_all = p3_overview_pie,
                     pie_nonfed = p3_nonfederal_pie,
                     pie_fed = p3_federal_pie,
                     yr = 2025,
                     png_out = "out/gw_map/gw_site_map_2025.png",
                     overall_agencies = p2_all_collaborators,
                     gw_raw = p1_fetch_gw_distinct)
  )
)

# List of all targets to run, (the order here matters for the tar_combine() fxn)
c(p1_fetch_targets, 
  p2_process_targets, 
  p3_viz_split_targets, 
  p3_viz_combine_targets, 
  downstream_targets,
  global_targets,
  gw_targets)


