library(targets)
library(tarchetypes)
library(tidyverse)

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", 
                            "raster", 
                            "sf", 
                            "maps", 
                            "scico", 
                            "cowplot", 
                            "geomtextpath", 
                            "sp",
                            "magick"))

source('src/data_utils.R')
source('src/plot_utils.R')
source('src/map_utils.R')

# output configs
font_fam <-'Source Sans Pro'
sysfonts::font_add_google(font_fam, regular.wt = 300, bold.wt = 700)
showtext::showtext_opts(dpi = 300)
showtext::showtext_auto(enable = TRUE)

# years in time series 
years_to_plot <- seq(1889, 2024, by = 1)
years_to_plot <- seq(2020, 2024, by = 1)

proj.string <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"

list(
  # Output of `national-flow-observations`
  tar_target(
    gage_data,
    readRDS("data/active_flow_gages_summary_wy.rds")
  ),
  # Put in long form with site_no x years active
  tar_target(
    gage_melt,
    time_data(gage_data) 
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
  # Prep sites for map layout (get location information)
  tar_target(
    site_map_CONUS,
    extract_sites(area_name = "CONUS", gage_info = gage_info)
  ),
  tar_target(
    site_map_AK,
    extract_sites(area_name = "AK", gage_info = gage_info)
  ),
  tar_target(
    site_map_HI,
    extract_sites(area_name = "HI", gage_info = gage_info)
  ),
  tar_target(
    site_map_PR,
    extract_sites(area_name = "PR", gage_info = gage_info)
  ),
  tarchetypes::tar_map(
    # Years 
    values = list(active_year = years_to_plot),
    # Plot bar chart of active streamgages through time
    tar_target(gage_bar_list,
               plot_gage_timeseries(gage_melt, 
                                    yr = active_year, 
                                    font_fam,
                                    max_year = 2025)),
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
                    yr = year_list, 
                    site_map = site_map_AK, 
                    state_map = state_map_AK)),
    tar_target(
      gage_map_list_PR,
      plot_gage_map(gage_melt = gage_melt, 
                    yr = year_list, 
                    site_map = site_map_PR, 
                    state_map = state_map_PR)),
    tar_target(
      gage_map_list_HI,
      plot_gage_map(gage_melt = gage_melt, 
                    yr = year_list, 
                    site_map = site_map_HI, 
                    state_map = state_map_HI)),
    # Plot bar chart and map together 
    tar_target(
      gage_frames,
      compose_chart(bar_chart = gage_bar_list, 
                    gage_map_CONUS = gage_map_list_CONUS,
                    gage_map_AK = gage_map_list_AK,
                    gage_map_HI = gage_map_list_HI,
                    gage_map_PR = gage_map_list_PR, 
                    yr = active_year),
      format = 'file'),
    unlist = TRUE,
    names = active_year
  ),

  # Years for animation
  tar_target(
    year_list,
    years_to_plot
  ),
  
  # Intermediate target to make sure the files have been updated before
  # running the full animation target
  tarchetypes::tar_files(
    gage_png_files,
    sprintf("out/gage_time_%s.png", year_list)
  ),
  
  # Create animation 
  tar_target(
    gage_gif,
    animate_frames_gif(frames = gage_png_files, 
                       out_file = 'out/gage_timeseries.gif',
                       reduce = TRUE, 
                       frame_delay_cs = 20, 
                       frame_rate = 4),
    format = 'file'
  ),

  # Add logo to gif
  tar_target(
    gif_final,
    {
      # import logo
      usgs_logo <- magick::image_read('usgs_logo_grey.png') |>
        magick::image_resize('x80') |>
        magick::image_colorize(100, "grey80")
     # add to gif 
     image_read(gage_gif) |>
     image_composite(usgs_logo, offset = '+180+920') |>
      image_write('out/gage_timeseries_logo.gif')
    },
    format = 'file'
  )
)
