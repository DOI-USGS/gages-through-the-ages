source('src/data_utils.R')

library(tidyverse)
library(geomtextpath)
library(magick)
library(showtext)
library(dataRetrieval)


# dakotas request ---------------------------------------------------------


gage_info <- readNWISsite(unique(gage_data$site))
str(gage_info)
dakota_gages <- gage_info |> filter(state_cd %in% c(38, 46)) |> select(site_no, station_nm, lat_va, long_va)

gage_dakotas_time <- gage_melt |>
  filter(site %in% dakota_gages$site_no) |>
  select(site_no = site) |>
  group_by(site_no) |>
  summarize(data_start = min(year), data_recent = max(year)) |>
  left_join(dakota_gages)

write_csv(gage_dakotas_time, 'gages_dakotas.csv')

# plotting ----------------------------------------------------------------


font_fam <-'Source Sans Pro'
sysfonts::font_add_google(font_fam, regular.wt = 400, bold.wt = 700)
showtext::showtext_opts(dpi = 300)
showtext::showtext_auto(enable = TRUE)

logo <- magick::image_read('usgs_logo_grey.png') %>%
  magick::image_resize('x100') %>%
  magick::image_colorize(100, "grey80")

gage_data <- readRDS("data/active_flow_gages_summary_wy.rds")
str(gage_data)

# reshape data for plotting
gage_melt <- gage_data |>
  unnest(which_years_active) |>
  unnest(gap_years) |>
  select(-n_years_active, -earliest_active_year) |>
  transform(gap_years = as.numeric(gap_years)) |>
  pivot_longer(c(which_years_active, gap_years), values_to = 'year', names_to = 'activity') |>
  filter(!is.na(year), year >= 1889, activity == 'which_years_active')
gage_melt

gages_by_year <- gage_melt |>
  group_by(year) |>
  summarize(n_sites = length(unique(site)))
str(gages_by_year)

## plot bar chart
active_year <- 2021

gages_by_year |>
  filter(year <= active_year) |>
  ggplot(
    aes(year, n_sites)
  ) +
  geom_bar(stat = "identity", fill = "#ededed") +
  geom_bar(data = .%>% filter(year == active_year), 
           stat = "identity",
           fill = '#0962b2') +
  geom_textline(data = head(gages_by_year, 60), 
                aes(x = year, y = n_sites, 
                    label = "Number of active gages through time"),
                color = 'grey80', size = 6, vjust = -0.5, text_smoothing = 40,
                family = font_fam, linecolor = NA
  ) +
  scale_x_continuous(
    breaks = scales::breaks_width(10), 
    expand = c(0,0.025)
  ) +
  scale_y_continuous(
    breaks = scales::breaks_width(2000),
    expand = c(0.025,0)
  ) +
  ylab(NULL) + xlab(NULL) +
  theme(
    axis.line = element_line(color = "#ededed"),
    axis.ticks = element_blank()
  )

## plot map
gage_info
active_year <- 2020
yr_gages <- gage_melt |>
  filter(year == as.numeric(active_year)) |>
  distinct(site)

# convert to sf 
sites.sf <- site_map |> st_as_sf() |> distinct()# all sites
states.sf <- state_map |> st_as_sf()

# sites active in a given year
gages_active <- sites.sf |>
  filter(site_no %in% yr_gages$site)# |>
  dplyr::select(site_no, contains('dec_')) |>
  st_as_sf(coords = c('dec_long_va', 'dec_lat_va'), na.fail = FALSE)

gages_active |>
  ggplot() +
  geom_sf(data = states.sf,
          linewidth = 1, color = 'white') +
  geom_sf(color = 'white', size = 2) +
  geom_sf(color = '#0962b2', size = 1, alpha = 0.8) +
  theme_void()


## compose frames


## animate