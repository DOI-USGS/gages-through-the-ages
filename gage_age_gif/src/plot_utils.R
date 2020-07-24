
# for each year (frame), plot gained gages and the age distribution
plot_twitter <- function(filename, gage_melt, yr, site_map, state_map, width = 1024, height = 512){
  
  theme_set(theme_classic(base_size=16))
  showtext_auto()
  
  # store vars for plotting
  yr_num <- as.numeric(as.character(yr))
  yr_max <- max(gage_melt$years_cum)
  
  # convert to sf 
  sites.sf <- site_map %>% st_as_sf() # all sites
  states.sf <- state_map %>% st_as_sf()
  
  # filter gage data to given year
  yr_gages <- gage_melt %>%
    filter(year == as.numeric(yr_num)) # change '==' to '<=' to plot ALL gages ever born
  
  # for beehive plot
  yr_bee <- yr_gages %>%
    group_by(site) %>%
    summarize(yrs_running = max(years_cum)) 

  # filter sites to those present
  yr_sites <- sites.sf %>%
    filter(site_no %in% yr_gages$site) %>% # this plots a site for any gage that has been born
    left_join(yr_bee, by = c('site_no' = 'site')) %>%
    arrange(desc(yrs_running)) # reorder to have smaller point appear on top for visibility
  
  # plot sites on map
  plot_map <- ggplot()+
    geom_sf(data = states.sf,  fill='grey10', color="black")+
    geom_sf(data = yr_sites, aes(color = yrs_running, size = yrs_running), alpha = 0.7, shape = 16)+
    scale_size(range = c(.1,2.4), limits = c(0,yr_max))+
    scale_color_scico(palette = 'imola', begin=0.2, end = 1, limits = c(0,yr_max))+
    theme_void(base_size=16)+
    theme(legend.position = 'none', 
          plot.title = element_text(size=20, color = 'grey70'), 
          plot.background = element_rect(fill = "black"),
          plot.caption = element_text(face = 'italic', hjust = 1, color = 'grey70'),
          plot.margin = unit(c(0,0,0,0), "cm"))
  
  plot_bee <- yr_bee %>%
    group_by(yrs_running) %>%
    summarize(sites = length(unique(site))) %>%
    mutate(half = sites/2)%>% # for mirrored axis
    ggplot()+
    geom_linerange(aes(x = yrs_running, ymin=0-half, ymax=half, color=yrs_running), size=1.3)+
    labs(x='Age of active gages', y='Number of gages')+
    theme(axis.line=element_blank(), 
          panel.grid.major.y = element_line(color='grey30'),
          axis.text.x = element_text(color = "grey70"),
          axis.title.x = element_text(color = "grey70"),
          axis.text.y = element_text(color = "grey70"),
          axis.title.y = element_text(color = "grey70"),
          aspect.ratio=1.5, 
          axis.ticks.y = element_blank(), 
          plot.title.position="plot",
          legend.position='none',
          plot.background=element_rect(fill='black', color='black'),
          panel.background=element_rect(fill='black', color='black'),
          plot.margin = unit(c(0,0,0,0), "cm"),
          plot.caption = element_text(face = 'italic', hjust = 0, color = 'grey70', size = 12),
          plot.subtitle = element_text(size = 12, color = 'grey70'),
          plot.title = element_text(size = 20, color = 'grey70'))+
    coord_flip()+
    scale_y_continuous(expand = c(0,0), limits = c(-230, 230), breaks = c(0,100,200), labels = c(0,200,400))+ # if showing inactive gages need to adjust to have axis reflect the max number of gages in a given class
    scale_x_continuous(expand=c(0,0), limits = c(1,yr_max), breaks=c(1,20, 40, 60, 80, 100, 120, 140))+
    scale_color_scico(palette = 'imola', begin=0.2, end = 1, limits = c(0,yr_max))
  
  # save plot - stylized to twitter
  ## write to png
  png(filename = filename, units='px', width = width, height = height)
  ## hacky to set px
  print({ 
    # combine everything
    plot_bee + plot_map + plot_layout(widths=c(1.2,2)) +
      plot_annotation(title = 'Gages through the ages', 
                      subtitle = 'Age and location of active U.S. Geological Survey stream gages', 
                      caption = "labs.waterdata.usgs.gov/visualizations/gages-through-the-ages",
                      theme = theme(plot.caption = element_text(face = 'italic', hjust = 0, color = 'grey70', size = 12),
                                    plot.subtitle = element_text(size = 12, color = 'grey70'),
                                    plot.background=element_rect(fill='black', color='black'),
                                    plot.title = element_text(size = 20, color = 'grey70')))
  })
  dev.off()
  
  ## timeline bar
  plot_timeline <- data.frame(Year = c(1889, 2020))%>%
    ggplot()+
    geom_segment(aes(x=min(Year), xend=max(Year), y=1, yend=1), size=2, color = 'grey70')+
    geom_point(aes(x=yr_num, y=1), size=3.5, color='#E83715', fill = 'transparent', stroke=2, shape=16)+
    geom_text(aes(label=Year, x=Year, y=1), vjust=2, color = 'grey70')+
    geom_text(aes(label=yr_num, x=yr_num, y=1), vjust=-1.5, color = 'grey70')+
    theme_void(base_size=16)+
    theme(text = element_text(size = 16, color = 'grey70'), plot.margin = unit(c(0,0,0,0), "mm"),
          plot.background=element_rect(fill='black', color='black'), panel.background=element_rect(fill='black', color='black'))
  
  png(filename = 'timeline.png', units='px', width = 400, height = 51)
  print({ 
    plot_timeline
  })
  dev.off()
  
  ## add USGS watermark & moving timeline
  img_yr <- image_read(filename)
  usgs <- image_read('usgs_logo_grey.png')
  timeline <- image_read('timeline.png')
  
  # rescle and recolor logo
  logo_mark <- image_scale(usgs, 150)%>%
    image_fill(color = 'grey10', fuzz = 50) %>%
    image_colorize(opacity = 100, color= 'grey10')
  
  # make composite image and save
  gif_final <- image_composite(img_yr, logo_mark, offset='+800+440')%>%
    image_composite(timeline, offset='+500+20') %>%
    image_write(path = filename, format='png')
  
}

plot_instagram <- function(filename, gage_melt, yr, site_map, state_map, width = 1080, height = 1080){
  
  theme_set(theme_classic(base_size=16))
  showtext_auto()
  
  # store vars for plotting
  yr_num <- as.numeric(as.character(yr))
  yr_max <- max(gage_melt$years_cum)
  
  # convert to sf 
  sites.sf <- site_map %>% st_as_sf() # all sites
  states.sf <- state_map %>% st_as_sf()
  
  # filter gage data to given year
  yr_gages <- gage_melt %>%
    filter(year == as.numeric(yr_num)) # change '==' to '<=' to plot ALL gages ever born
  
  # for beehive plot
  yr_bee <- yr_gages %>%
    group_by(site) %>%
    summarize(yrs_running = max(years_cum)) 
  
  # filter sites to those present
  yr_sites <- sites.sf %>%
    filter(site_no %in% yr_gages$site) %>% # this plots a site for any gage that has been born
    left_join(yr_bee, by = c('site_no' = 'site')) %>%
    arrange(desc(yrs_running)) # reorder to have smaller point appear on top for visibility
  
  # plot sites on map
  plot_map <- ggplot()+
    geom_sf(data = states.sf,  fill='grey10', color="black")+
    geom_sf(data = yr_sites, aes(color = yrs_running, size = yrs_running), alpha = 0.7, shape = 16)+
    scale_size(range = c(.1,2.4), limits = c(0,yr_max))+
    scale_color_scico(palette = 'imola', begin=0.2, end = 1, limits = c(0,yr_max))+
    theme_void(base_size=16)+
    theme(legend.position = 'none', 
          plot.title = element_text(size=20, color = 'grey70'), 
          plot.background = element_rect(fill = "black"),
          plot.caption = element_text(face = 'italic', hjust = 1, color = 'grey70'),
          plot.margin = unit(c(0,0,0,0), "cm"))
  
  plot_bee <- yr_bee %>%
    group_by(yrs_running) %>%
    summarize(sites = length(unique(site))) %>%
    mutate(half = sites/2)%>% # for mirrored axis
    ggplot()+
    geom_linerange(aes(x = yrs_running, ymin=0-half, ymax=half, color=yrs_running), size=1.3)+
    labs(x='Age of active gages', y='Number of gages')+
    theme(axis.line=element_blank(), 
          panel.grid.major.y = element_line(color='grey30'),
          axis.text.x = element_text(color = "grey70"),
          axis.title.x = element_text(color = "grey70"),
          axis.text.y = element_text(color = "grey70"),
          axis.title.y = element_text(color = "grey70"),
          aspect.ratio=1.5, 
          axis.ticks.y = element_blank(), 
          plot.title.position="plot",
          legend.position='none',
          plot.background=element_rect(fill='black', color='black'),
          panel.background=element_rect(fill='black', color='black'),
          plot.margin = unit(c(0,0,0,0), "cm"),
          plot.caption = element_text(face = 'italic', hjust = 0, color = 'grey70', size = 12),
          plot.subtitle = element_text(size = 12, color = 'grey70'),
          plot.title = element_text(size = 20, color = 'grey70'))+
    coord_flip()+
    scale_y_continuous(expand = c(0,0), limits = c(-230, 230), breaks = c(0,100,200), labels = c(0,200,400))+ # if showing inactive gages need to adjust to have axis reflect the max number of gages in a given class
    scale_x_continuous(expand=c(0,0), limits = c(1,yr_max), breaks=c(1,20, 40, 60, 80, 100, 120, 140))+
    scale_color_scico(palette = 'imola', begin=0.2, end = 1, limits = c(0,yr_max))
  
  ## write to png
  png(filename = filename, units='px', width = width, height = height)

  print({ 
    plot_bee+theme(aspect.ratio=2.2) + plot_map + plot_layout(widths=c(.3,1)) +
      plot_annotation(title = 'Gages through the ages', 
                      subtitle = 'Age and location of active U.S. Geological Survey stream gages', 
                      caption = "labs.waterdata.usgs.gov/visualizations/gages-through-the-ages\n\n\n",
                      theme = theme(plot.caption = element_text(face = 'italic', hjust = 0, color = 'grey70', size = 24),
                                    plot.subtitle = element_text(size = 24, color = 'grey70'),
                                    plot.background=element_rect(fill='black', color='black'),
                                    plot.title = element_text(size = 36, color = 'grey70'),
                                    plot.margin = unit(c(50,0,50,30), 'pt')))
  })
  dev.off()
  
  ## timeline bar
  plot_timeline <- data.frame(Year = c(1889, 2020))%>%
    ggplot()+
    geom_segment(aes(x=min(Year), xend=max(Year), y=1, yend=1), size=2, color = 'grey70')+
    geom_point(aes(x=yr_num, y=1), size=6, color='#E83715', fill = 'transparent', stroke=2, shape=16)+
    geom_text(aes(label=Year, x=Year, y=1), vjust=2, color = 'grey70')+
    geom_text(aes(label=yr_num, x=yr_num, y=1), vjust=-1.5, size = 7, color = 'grey70')+
    theme_void(base_size=16)+
    theme(text = element_text(size = 16, color = 'grey70'), 
          plot.margin = unit(c(0,0,0,0), "mm"),
          plot.background=element_rect(fill='black', color='black'), 
          panel.background=element_rect(fill='black', color='black'))
  
  png(filename = 'timeline.png', units='px', width = 801, height = 100)
  print({ 
    plot_timeline
  })
  dev.off()
  
  ## add USGS watermark & moving timeline
  img_yr <- image_read(filename)
  usgs <- image_read('usgs_logo_insta_h100.png')
  timeline <- image_read('timeline.png')
  
  # make composite image and save
  gif_final <- image_composite(img_yr, usgs, offset='+0+980')%>%
    image_composite(timeline, offset='+140+160') %>%
    image_write(path = filename, format='png')
  
}

plot_facebook <- function(filename, gage_melt, yr, site_map, state_map, width = 1200, height = 628){
  
  theme_set(theme_classic(base_size=16))
  showtext_auto()
  
  # store vars for plotting
  yr_num <- as.numeric(as.character(yr))
  yr_max <- max(gage_melt$years_cum)
  
  # convert to sf 
  sites.sf <- site_map %>% st_as_sf() # all sites
  states.sf <- state_map %>% st_as_sf()
  
  # filter gage data to given year
  yr_gages <- gage_melt %>%
    filter(year == as.numeric(yr_num)) # change '==' to '<=' to plot ALL gages ever born
  
  # for beehive plot
  yr_bee <- yr_gages %>%
    group_by(site) %>%
    summarize(yrs_running = max(years_cum)) 
  
  # filter sites to those present
  yr_sites <- sites.sf %>%
    filter(site_no %in% yr_gages$site) %>% # this plots a site for any gage that has been born
    left_join(yr_bee, by = c('site_no' = 'site')) %>%
    arrange(desc(yrs_running)) # reorder to have smaller point appear on top for visibility
  
  # plot sites on map
  plot_map <- ggplot()+
    geom_sf(data = states.sf,  fill='grey10', color="black")+
    geom_sf(data = yr_sites, aes(color = yrs_running, size = yrs_running), alpha = 0.7, shape = 16)+
    scale_size(range = c(.1,2.4), limits = c(0,yr_max))+
    scale_color_scico(palette = 'imola', begin=0.2, end = 1, limits = c(0,yr_max))+
    theme_void(base_size=16)+
    theme(legend.position = 'none', 
          plot.title = element_text(size=20, color = 'grey70'), 
          plot.background = element_rect(fill = "black"),
          plot.caption = element_text(face = 'italic', hjust = 1, color = 'grey70'),
          plot.margin = unit(c(0,0,0,0), "cm"))
  
  plot_bee <- yr_bee %>%
    group_by(yrs_running) %>%
    summarize(sites = length(unique(site))) %>%
    mutate(half = sites/2)%>% # for mirrored axis
    ggplot()+
    geom_linerange(aes(x = yrs_running, ymin=0-half, ymax=half, color=yrs_running), size=1.3)+
    labs(x='Age of active gages', y='Number of gages')+
    theme(axis.line=element_blank(), 
          panel.grid.major.y = element_line(color='grey30'),
          axis.text.x = element_text(color = "grey70"),
          axis.title.x = element_text(color = "grey70"),
          axis.text.y = element_text(color = "grey70"),
          axis.title.y = element_text(color = "grey70"),
          aspect.ratio=1.5, 
          axis.ticks.y = element_blank(), 
          plot.title.position="plot",
          legend.position='none',
          plot.background=element_rect(fill='black', color='black'),
          panel.background=element_rect(fill='black', color='black'),
          plot.margin = unit(c(0,0,0,0), "cm"),
          plot.caption = element_text(face = 'italic', hjust = 0, color = 'grey70', size = 12),
          plot.subtitle = element_text(size = 12, color = 'grey70'),
          plot.title = element_text(size = 20, color = 'grey70'))+
    coord_flip()+
    scale_y_continuous(expand = c(0,0), limits = c(-230, 230), breaks = c(0,100,200), labels = c(0,200,400))+ # if showing inactive gages need to adjust to have axis reflect the max number of gages in a given class
    scale_x_continuous(expand=c(0,0), limits = c(1,yr_max), breaks=c(1,20, 40, 60, 80, 100, 120, 140))+
    scale_color_scico(palette = 'imola', begin=0.2, end = 1, limits = c(0,yr_max))
  
  # save plot - stylized to twitter
  ## write to png
  png(filename = filename, units='px', width = width, height = height)
  ## hacky to set px
  print({ 
    # combine everything
    plot_bee + plot_map + plot_layout(widths=c(1.2,2)) +
      plot_annotation(title = 'Gages through the ages', 
                      subtitle = 'Age and location of active U.S. Geological Survey stream gages', 
                      caption = "labs.waterdata.usgs.gov/visualizations/gages-through-the-ages",
                      theme = theme(plot.caption = element_text(face = 'italic', hjust = 0, color = 'grey70', size = 12),
                                    plot.subtitle = element_text(size = 12, color = 'grey70'),
                                    plot.background=element_rect(fill='black', color='black'),
                                    plot.title = element_text(size = 20, color = 'grey70')))
  })
  dev.off()
  
  ## timeline bar
  plot_timeline <- data.frame(Year = c(1889, 2020))%>%
    ggplot()+
    geom_segment(aes(x=min(Year), xend=max(Year), y=1, yend=1), size=2, color = 'grey70')+
    geom_point(aes(x=yr_num, y=1), size=3.5, color='#E83715', fill = 'transparent', stroke=2, shape=16)+
    geom_text(aes(label=Year, x=Year, y=1), vjust=2, color = 'grey70')+
    geom_text(aes(label=yr_num, x=yr_num, y=1), vjust=-1.5, color = 'grey70')+
    theme_void(base_size=16)+
    theme(text = element_text(size = 16, color = 'grey70'), plot.margin = unit(c(0,0,0,0), "mm"),
          plot.background=element_rect(fill='black', color='black'), panel.background=element_rect(fill='black', color='black'))
  
  png(filename = 'timeline.png', units='px', width = 400, height = 51)
  print({ 
    plot_timeline
  })
  dev.off()
  
  ## add USGS watermark & moving timeline
  img_yr <- image_read(filename)
  usgs <- image_read('usgs_logo_grey.png')
  timeline <- image_read('timeline.png')
  
  # rescle and recolor logo
  logo_mark <- image_scale(usgs, 150)%>%
    image_fill(color = 'grey10', fuzz = 50) %>%
    image_colorize(opacity = 100, color= 'grey10')
  
  # make composite image and save
  gif_final <- image_composite(img_yr, logo_mark, offset='+1000+550')%>%
    image_composite(timeline, offset='+650+20') %>%
    image_write(path = filename, format='png')
  
}

combine_frames <- function(file_out, hash_table){
  
  frame_names <- hash_table$filename
  # display the last frame first
  collapse_frames <- paste(c(tail(frame_names,1), frame_names), collapse = ' ')
  
  system(sprintf('convert %s %s', collapse_frames, file_out))
  reg_frames <- paste(sprintf('"#%s"', 1:(length(frame_names)-1)), collapse = ' ')
  system(sprintf('gifsicle -b -O3 %s -d0 "#0" -d14 %s -d400 "#%s" --colors 256', file_out, reg_frames, length(frame_names)))
  
}