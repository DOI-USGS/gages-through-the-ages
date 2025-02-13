library(targets)
library(tidyverse)
library(cowplot)
library(sf)
library(sp)
library(geomtextpath)

# Open project `gage_timeseries_gif.Rproj`
tar_load(gage_melt)
tar_load(state_map)
tar_load(site_map)
source('src/data_utils.R')
source('src/plot_utils.R')
source('src/map_utils.R')

active_year <- 2021 # most up to date year I have

# output configs
font_fam <-'Source Sans Pro'
sysfonts::font_add_google(font_fam, regular.wt = 300, bold.wt = 700)
showtext::showtext_opts(dpi = 300)
showtext::showtext_auto(enable = TRUE)
blue_color <- "#143D60"
grey_color <- "#CFD3D3"
# Load in USGS logo (also a black logo available)
usgs_logo <- magick::image_read("usgs_logo_grey.png") |>
  magick::image_colorize(opacity = 100, color = blue_color)

gages_by_year <- gage_melt |>
  group_by(year) |>
  summarize(n_sites = length(unique(site)))

# filter gage data to given year
yr_gages <- gage_melt |>
  filter(year == as.numeric(active_year)) |>
  distinct(site)

# convert to sf 
states.sf <- state_map |> st_as_sf()
sites.sf <- site_map |> st_as_sf() |> 
  distinct() |> 
  st_transform(st_crs(states.sf)) |>
  st_intersection(states.sf) # drops south pacific islands



# Get data by states
gages_info <- readRDS("data/active_flow_gages_summary_wy.rds") %>%
  pull(site) %>% 
  dataRetrieval::readNWISsite() %>% 
  select(site_no, state_cd)

state_lookup <- tidycensus::fips_codes |> 
  group_by(state) |>
  summarise(state_cd = unique(state_code))

# sites active in a given year
gages_active <- sites.sf |>
  filter(site_no %in% yr_gages$site) |> 
  left_join(gages_info, by = "site_no") |>
  left_join(state_lookup, 
            by = "state_cd")

# summarize number of sites by state 
gages_by_state <- gages_active |>
  sf::st_drop_geometry() |>
  group_by(state) |>
  summarise(n_sites = n())

# plot map
gage_map <- gages_active |>
  ggplot() +
  geom_sf(data = states.sf, fill = grey_color,
          linewidth = 0.25, color = 'white') +
  geom_sf(color = blue_color, size = 0.1, alpha = 0.7) +
  theme_void() 

# state-bar graph
gage_states <- gages_by_state |>
  arrange(n_sites) |>
  ggplot(aes(x = n_sites,
             y = reorder(state, n_sites))) + 
  geom_bar(stat = "identity", fill = grey_color, width = 0.8) +
  ylab(NULL) + xlab(NULL) +
  annotate("text",
           label = sprintf("Number of active\ngages by state\nin %s", active_year),
           y = 5, x = 700, hjust = 1,
           color = "#61677A", size = 8/.pt, family = font_fam) +
  theme(
    text = element_text(size = 20/.pt, margin=margin(r = 0, t = 0)),
    plot.background = element_rect(fill = 'white'),
    panel.background = element_rect(fill = 'white'),
    axis.line = element_line(color = grey_color, linewidth = 0.25),
    axis.ticks = element_blank(),
    axis.text.y = element_text(hjust = 1, margin=margin(r = -0.5, t = 0)),
    axis.text.x = element_text(vjust = 0, margin=margin(r = 0, t = -2))
  )

# time series bar graph (along bottom)
gage_bar <- gages_by_year |>
  ggplot(
    aes(year, n_sites)
  ) +
  geom_bar(stat = "identity", fill = grey_color, width = 0.8) +
  geom_bar(data = .%>% filter(year == active_year), 
           stat = "identity",
           fill = blue_color) +
  geom_textline(data = gages_by_year, 
                aes(x = year, y = n_sites, 
                    label = "Number of active gages through time"),
                hjust = 0.05,
                color = "#61677A", size = 8/.pt, vjust = -0.35, text_smoothing = 30,
                family = font_fam, linecolor = NA
  ) +
  scale_x_continuous(
    breaks = scales::breaks_width(10), 
    expand = c(0,0.025),
    limits = c(NA, 2022)
  ) +
  scale_y_continuous(
    breaks = scales::breaks_width(2000),
    expand = expansion(add = c(500,0))
  ) +
  ylab(NULL) + xlab(NULL) +
  theme(
    text = element_text(size = 20/.pt, margin=margin(r = 0, t = 0)),
    plot.background = element_rect(fill = 'white'),
    panel.background = element_rect(fill = 'white'),
    axis.line = element_line(color = grey_color, linewidth = 0.25),
    axis.ticks = element_blank(),
    axis.text.y = element_text(hjust = 1, margin=margin(r = -0.5, t = 0)),
    axis.text.x = element_text(vjust = 0, margin=margin(r = 0, t = -2))
  )



ggdraw(xlim = c(0, 1), ylim = c(0,1)) +
  # create background canvas
  draw_grob(grid::rectGrob(
    x = 0, y = 0, 
    width = 2, height = 2,
    gp = grid::gpar(fill = 'white', alpha = 1, col = 'white')
  )) +
  draw_plot(
    gage_bar,
    x = 0.015,
    y = 0,
    height = 0.20, 
    width = 0.76
  ) +
  draw_plot(
    gage_states,
    x = 0.78,
    y = 0.0,
    height = 0.95,
    width = 0.22
  ) +
  draw_plot(
    gage_map,
    x = 0.0,
    y = 0.15,
    height = 0.76,
    width = 0.80
  )+
  draw_text(sprintf("Active Streamgages, 1889 to %s", active_year),
            x = 0.18, y = 0.945,
            hjust = 0, vjust = 1,
            family = font_fam,
            size = 14) +
  # Add logo
  draw_image(usgs_logo, 
             x = 0.025,
             y = 0.90,
             width = 0.1, 
             hjust = 0, vjust = 0, 
             halign = 0, valign = 0)

ggsave("out/standalone_2021.png", width = 6, height = 4, dpi = 300, units = 'in')



