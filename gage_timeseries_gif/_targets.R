library(targets)
library(tidyverse)

options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "raster", "sf", 
                            "maps", #"maptools",
                            "scico", "cowplot", "geomtextpath", 
                            "sp","magick"))

source('src/data_utils.R')
source('src/plot_utils.R')
source('src/map_utils.R')

# output configs
font_fam <-'Source Sans Pro'
sysfonts::font_add_google(font_fam, regular.wt = 300, bold.wt = 700)
showtext::showtext_opts(dpi = 300)
showtext::showtext_auto(enable = TRUE)

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
  # Prep shifted states for map layout
  tar_target(
    AK,
    list(abrv = 'AK', scale = 0.37, shift = I(c(90,-460)), 
         rotate = I(-50), regions = I("USA:alaska"))
  ),
  tar_target(
    HI,
    list(abrv ='HI', scale = 1, shift = I(c(520, -110)), 
         rotate = I(-35), regions = I("USA:hawaii"))
  ),
  tar_target(
    PR, 
    list(abrv = 'PR', scale = 2.5, shift = I(c(-140, 90)), 
         rotate = 20, regions = I("Puerto Rico"))
  ),
  tar_target(
    state_map,
    fetch_state_map(AK, HI, PR)
  ),
  # Prep shifted sites for map layout
  tar_target(
    site_map,
    shift_sites(AK, HI, PR, gage_data = "data/active_flow_gages_summary_wy.rds")
  ),
  # Years for animation
  tar_target(
    year_list,
    seq(1889, 2022, by = 1)
  ),
  # Plot bar chart of active streamgages through time
  tar_target(
    gage_bar_list,
    plot_gage_timeseries(gage_melt, year_list, font_fam),
    pattern = map(year_list)
  ),
  # Map active streamgages through time - shifted layout
  tar_target(
    gage_map_list,
    plot_gage_map(gage_melt, year_list, site_map, state_map),
    pattern = map(year_list)
  ),
  # Plot bar chart and map together 
  tar_target(
    gage_frames,
    compose_chart(gage_bar_list, gage_map_list, year = year_list),
    format = 'file',
    pattern = map(year_list, gage_bar_list, gage_map_list)
  ),
  #tar_target(
  #  gage_frames_scaled,
  #  resize_frames(gage_frames, scale_width = 800, dir_out = 'out/'),
  #  format = 'file'
  #),
  # Animate frames to gif
  tar_target(
    gage_gif,
    animate_frames_gif(gage_frames, 'out/gage_timeseries.gif',
                   reduce = TRUE, frame_delay_cs = 20, frame_rate = 4),
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
