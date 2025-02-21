#' Plot gage age chart
#' 
plot_gage_age <- function(gage_melt, yr, font_fam){
  
  gage_yr <- gage_melt |>
    filter(year == yr) |>
    group_by(years_since_active) |>
    summarize(n_sites = n())
  
  gage_yr |>
    ggplot(aes(y = years_since_active,
               x = n_sites)) +
    geom_linerange(stat = "identity", 
                   aes(xmin = 0, xmax = n_sites),
                   color = grey_light) +
    scale_y_continuous(limits = c(0, 165),
                       breaks = c(0, 50, 100, 150),
                       expand = c(0, 0.025),
                       position = "right") +
    #scale_x_continuous(limits = c(0, 450),
    #                   breaks = c(0, 200, 400)) +
    scale_x_reverse(breaks = c(0, 200, 400),
                    limits = c(450, 0))+
    ylab(NULL) + xlab(NULL) +
    theme(
      text = element_text(size = 22/.pt, margin = margin(r = 0, t = 0)),
      plot.background = element_rect(fill = 'transparent', color = 'transparent'),
      panel.background = element_rect(fill = 'transparent', color = 'transparent'),
      axis.line.x = element_line(color = grey_light, linewidth = 0.25),
      axis.line.y.right = element_line(color = grey_light, linewidth = 0.25),
      axis.line.y.left = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank(),
      axis.text.y.right = element_text(),
      axis.text.y.left = element_blank(),
      axis.text.x = element_text(vjust = 0, margin = margin(r = 0, t = -2))
    )
    
  
}

#' Plot bar chart of active gages
#' @param gage_melt long form, gage site_no & years active
#' @param yr year being shown
plot_gage_timeseries <- function(gage_melt, yr, font_fam){
  
  # store vars for plotting
  yr_max <- max(gage_melt$year)
  
  gages_by_year <- gage_melt |>
    group_by(year) |>
    summarize(n_sites = length(unique(site)))
  
  ## plot bar chart
  gages_by_year |>
    ggplot(
      aes(x = year, y = n_sites)
    ) +
    geom_bar(stat = "identity", fill = grey_light, width = 0.6) +
    geom_bar(data = .%>% filter(year == yr), 
             stat = "identity",
             fill = blue_color) +
    geom_textline(data = gages_by_year, 
                  aes(x = year, y = n_sites, 
                      label = "Number of active gages through time"),
                  hjust = 0.05,
                  color = grey_dark, size = 8/.pt, vjust = -0.35, text_smoothing = 50,
                  family = font_fam, linecolor = NA
    ) +
    scale_x_continuous(
      breaks = scales::breaks_width(10), 
      expand = c(0, 0.025),
      limits = c(NA, yr_max + 1)
    ) +
    scale_y_continuous(
      breaks = scales::breaks_width(2000),
      expand = expansion(add = c(500,0))
    ) +
    ylab(NULL) + xlab(NULL) +
    theme(
      text = element_text(size = 22/.pt, margin = margin(r = 0, t = 0)),
      plot.background = element_rect(fill = 'transparent', color = 'transparent'),
      panel.background = element_rect(fill = 'transparent', color = 'transparent'),
      axis.line = element_line(color = grey_light, linewidth = 0.25),
      axis.ticks = element_blank(),
      panel.grid = element_blank(),
      axis.text.y = element_text(hjust = 1, margin = margin(r = -0.5, t = 0)),
      axis.text.x = element_text(vjust = 0, margin = margin(r = 0, t = -2))
    )
  
}

#' Plot map of active gages
#' @param gage_melt long form, gage site_no & years active
#' @param active_year year being shown
#' @param site_map shifted sites to matcvh state_map
#' @param state_map shifted states and territories
plot_gage_map <- function(gage_melt, yr, site_map, state_map){
  
  # filter gage data to given year
  yr_gages <- gage_melt |>
    filter(year == as.numeric(yr)) |>
    distinct(site)
                                  
  # sites active in a given year
  gages_active <- site_map |>
    dplyr::filter(site_no %in% yr_gages$site)
  
  # plot map
  gage_map <- gages_active |>
    ggplot() +
    geom_sf(data = state_map, fill = grey_light,
            linewidth = 0.25, color = 'white') +
    geom_sf(color = blue_color, size = 0.1, alpha = 0.7) +
    theme_void() 
  
  return(gage_map)
  
}


#' Compose map and bar chart together
#' @param bar_chart timeseries bar chart of active flow gages
#' @param year year being shown
#' @param gage_map maps of active gages
compose_chart <- function(bar_chart, 
                          age_chart,
                          gage_map_CONUS, 
                          gage_map_AK, 
                          gage_map_PR, 
                          gage_map_HI, 
                          yr,
                          png_out,
                          standalone_logic,
                          gage_melt){
  

  # summary stats for standalone viz
  average_age <- gage_melt |>
    filter(year == yr) |>
    summarize(age = mean(years_since_active),
              total_gages = n()) 
  
  
  # base composition for both standalone and gif
  base_plot <- ggdraw(xlim = c(0, 1), 
         ylim = c(0,1)) +
    # create background canvas
    draw_grob(grid::rectGrob(
      x = 0, y = 0, 
      width = 2, height = 2,
      gp = grid::gpar(fill = 'white', alpha = 1, col = 'white')
    )) +
    draw_plot(
      bar_chart,
      x = 0.0,
      y = 0,
      height = 0.25, width = 1 - 0.2
    )+
    draw_plot(
      gage_map_CONUS,
      x = -0.02,
      y = 0.12,
      width = 1.03
      )+
    draw_text("Alaska",
              x = 0.17, y = 0.27,
              color = grey_dark,
              family = font_fam, size = 7) +
    draw_plot(
      gage_map_AK,
      x = -0.40,
      y = 0.24,
      height = 0.23
    )+
    draw_plot(
      gage_map_PR,
      x = 0.16,
      y = 0.28,
      height = 0.05
    )+
    draw_text("Puerto Rico",
              x = 0.67, y = 0.27,
              color = grey_dark,
              family = font_fam, size = 7) +
    draw_plot(
      gage_map_HI,
      x = -0.27,
      y = 0.27,
      height = 0.25
    )+
    draw_text("Hawaii",
              x = 0.38, y = 0.27,
              color = grey_dark,
              family = font_fam, size = 7) +
    # Add logo
    draw_image(usgs_logo, 
               x = 0.975,
               y = 0.925,
               width = 0.15, 
               hjust = 1, vjust = 0, 
               halign = 0, valign = 0)+
    draw_text(sprintf("Active Streamgages, 1889 to %s", yr),
              x = 0.025, y = 0.973,
              hjust = 0, vjust = 1,
              family = font_fam,
              size = 18)
  
  if(standalone_logic){
    final_plot <- base_plot +
      draw_text(text = "average age\nof active gages",
                x = 0.9, y = 0.08,
                hjust = 0.5, 
                family = font_fam,
                size = 7,
                lineheight = 1) +
      draw_text(text = sprintf("%s yrs", round(average_age$age, 1)),
                x = 0.9, y = 0.13,
                hjust = 0.5, 
                family = font_fam,
                size = 18) +
      draw_text(text = "total number\nof active gages",
                x = 0.9, y = 0.20,
                hjust = 0.5, 
                family = font_fam,
                size = 7,
                lineheight = 1) +
      draw_text(text = scales::comma(average_age$total_gages),
                x = 0.9, y = 0.25,
                hjust = 0.5, 
                family = font_fam,
                size = 18)
  } else {
    final_plot <- base_plot +
      draw_plot(
        age_chart,
        x = 0.8,
        y = 0.0,
        height = 0.50, width = 0.2
      ) +
      draw_text("yrs",
                size = 7, family = font_fam,
                x = 0.98,
                y = 0.43,
                hjust = 1)
  }

  
  ggsave(png_out, 
         width = 5, height = 5, dpi = 300, units = 'in')
  
  return(png_out)
  
}

#' Animate frames to create gif
#' @param frames list of pngs, frames for gif
#' @param out_file output file name for gif
#' @param frame_delay_cs time spent on each frame
#' @param reduce logical, whether or not to apply gifsicle compression
#' @param frame_rate frames per second 
animate_frames_gif <- function(frames, out_file, reduce = TRUE, frame_delay_cs, frame_rate){
  frames %>%
    magick::image_read() %>%
    image_join() %>%
    image_animate(
      delay = frame_delay_cs,
      optimize = TRUE,
      fps = frame_rate
    ) %>%
    image_write(out_file)
  
  if(reduce == TRUE){
    optimize_gif(out_file, frame_delay_cs)
  }
  
  return(out_file)
  
}

#' Resize frames
#' @param frames list of pngs, frames for gif
#' @param scale_width desired output frame width
#' @param scale_percent optional, resize frames using percent of current size
#' @param dir_out Directory to store resized frames 
resize_frames <- function(frames, scale_width, scale_percent = NULL, dir_out) {
  
  if(!dir.exists(dir_out)) dir.create(dir_out)
  
  frames_in <- frames %>%
    image_read() %>%
    image_join()
  info <- image_info(frames_in)
  
  # scale png frames proportionally 
  # either based on a percentage of current size or width
  if(!is.null(scale_percent)){
    scale_width <- info$width*(scale_percent/100)
  }
  
  frames_scaled <- frames_in %>%
    image_scale(scale_width) 
  
  png_names <-  sprintf('%s/%s', dir_out, gsub('out/', '', frames)) 
  map2(as.list(frames_scaled), png_names, ~image_write(.x, .y))
  
  return(png_names)
  
}


#' Optimize gif
#' @param out_file output file name for gif
#' @param frame_delay_cs time spent on each frame
optimize_gif <- function(out_file, frame_delay_cs) {
  
  # simplify the gif with gifsicle - cuts size by about 2/3
  gifsicle_command <- sprintf('gifsicle -b -O3 -d %s --colors 20 %s',
                              frame_delay_cs, out_file)
  system(gifsicle_command)
  
  return(out_file)
}

