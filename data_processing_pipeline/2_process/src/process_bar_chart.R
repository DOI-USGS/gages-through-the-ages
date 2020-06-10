
process_bar_chart <- function(target_name, gage_year_data_file, state_sp) {
  
  size <- size_svg_map(state_sp)
  
  bars <- readRDS(gage_year_data_file) %>% 
    mutate(year = as.numeric(year)) %>% 
    select(year, n = n_gages_per_year)
  
  max.sites <- max(bars$n)
  
  root <- read_xml("<g/>") 
  g.bars <- xml_add_child(root, 'g', id='year-bars')
  g.mousers <- xml_add_sibling(g.bars, 'g', id = 'year-bars-mouser', class='mouser-shape')
  
  lm <- 45 
  w <- round(size[['x']]*72, 1) - lm
  h <- 100
  
  spc <- round(0.002*w, 1)
  bin.w <- round((w-(length(bars$n)-1)*spc)/length(bars$n),1)
  bin.h <- round(bars$n/max.sites*h, 1)
  
  for (i in 1:length(bars$year)){
    xml_add_child(g.bars, 'rect', class = "gage-count-bar",
                  x = as.character((i-1)*(bin.w+spc)), 
                  height = as.character(bin.h[i]), 
                  width = as.character(bin.w), y = as.character(h - bin.h[i]), 
                  id = paste0('yr', bars$year[i]), class = paste0('total-bar-', bars$year[i])) #
    xml_add_child(g.mousers, 'rect',
                  x = as.character((i-1)*(bin.w+spc)-spc/2), 
                  height = as.character(h), 
                  width = as.character(bin.w+spc), 
                  onmousemove = sprintf("hovertext('%s gages in %s', evt);", bars$n[i], bars$year[i]),
                  onmouseover = sprintf("vizlab.pause('%s')", bars$year[i]),
                  onmouseout = sprintf("hovertext('');vizlab.play()", bars$year[i]))
  }
  write_xml(x = root, file = target_name)
}


# Helpers
size_svg_map <- function(sp) {
  apply(sp::bbox(sp), 1, diff)/500000
}
