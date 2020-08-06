
build_svg <- function(svg_fp, state_dat_raw, state_loc_info, svg_height, svg_width, start_yr, end_yr) {
  
  # Create whole SVG 
  svg_root <- init_svg(svg_width, svg_height, is_pixels = TRUE)
  
  # Prepare data & setup configs based on data
  states <- unique(state_loc_info$state)
  state_dat <- prepare_svg_data(state_dat_raw, states, start_yr, end_yr)
  scale_width <- unique(state_loc_info$state_chart_width) / length(start_yr:end_yr)   
  
  ##### Add the SVG nodes #####
  
  # Add the bars for each state
  add_state_bars(svg_root, state_dat, state_loc_info, states, scale_width)
  
  # Add the invisible hover rectangles for each state
  add_state_hovers(svg_root, state_dat, state_loc_info, states, scale_width)
  
  
  ##### Write out final SVG to file #####
  
  xml2::write_xml(svg_root, file = svg_fp)
  
}

prepare_svg_data <- function(raw_dat, states_to_use, start_yr, end_yr) {
  # Expect certain column names coming in
  stopifnot(all(c("year", "state", "n_gages") %in% names(raw_dat)))
  
  dat <- raw_dat %>% 
    ungroup() %>% # just in case it's grouped (causes weird issues)
    # Remove potential missing info
    filter(!is.na(year), !is.na(state), !is.na(n_gages)) %>% 
    filter(year %in% start_yr:end_yr) %>% 
    filter(state %in% states_to_use) # Only use states that have location config info
  
  # Fill in missing years with 0s
  expand.grid(state = unique(dat$state), year = start_yr:end_yr) %>% 
    arrange(state, year) %>% 
    left_join(dat) %>% 
    mutate(n_gages = tidyr::replace_na(n_gages, 0))
}

init_svg <- function(width = 8, height = 5, ppi = 72, is_pixels = FALSE) {
  view_box <- sprintf("%s %s %s %s", 0, 0, ifelse(is_pixels, width, width*ppi), ifelse(is_pixels, height, height*ppi))
  # create the main "parent" svg node. This is the top-level part of the svg
  svg_root <- xml_new_root('svg', viewBox = view_box, preserveAspectRatio="xMidYMid meet", 
                           xmlns="http://www.w3.org/2000/svg", `xmlns:xlink`="http://www.w3.org/1999/xlink", version="1.1" )
  return(svg_root)
}

add_state_bars <- function(svg_root, state_dat, state_loc_info, states, scale_width) {
  
  for(st in states) {
    
    state_nm <- switch(
      st,
      DC = "District of Columbia",
      PR = "Puerto Rico",
      state.name[which(state.abb == st)]
    )
    
    # Prepare state data
    st_dat <- filter(state_dat, state == st)
    st_pos <- filter(state_loc_info, state == st)
    
    # Height scale differs for each state because their max 
    # bar height differs
    scale_height <- unique(state_loc_info$state_chart_height) / max(st_dat$n_gages)
    
    svg_root %>% 
      # Create a group for the state's bar path to go
      add_state_grp(state_nm, trans_x = st_pos$x, trans_y = st_pos$y, scale_x = scale_width, 
                    scale_y = scale_height, grp_id = "bars") %>% 
      # add the path for the VA-specific bars
      add_bar_path(state_nm, st_dat)
    
  }
  
}

add_state_hovers <- function(svg_root, state_dat, state_loc_info, states, scale_width) {
  
  for(st in states) {
    
    state_nm <- switch(
      st,
      DC = "District of Columbia",
      PR = "Puerto Rico",
      state.name[which(state.abb == st)]
    )
    
    # Prepare state data
    st_dat <- filter(state_dat, state == st)
    st_pos <- filter(state_loc_info, state == st)
    
    # Height scale differs for each state because their max 
    # bar height differs
    scale_height <- unique(state_loc_info$state_chart_height) / max(st_dat$n_gages)
    
    st_hovers <- svg_root %>%
      add_state_grp(state_nm, trans_x = st_pos$x, trans_y = st_pos$y, scale_x = scale_width, 
                    scale_y = scale_height, grp_id = "hovers") %>% 
      add_hover_rects(st_dat)
  }
  
}

add_state_grp <- function(svg_root, state_nm, trans_x, trans_y, scale_x = 1, scale_y = 1, grp_id = "box") {
  xml_add_child(svg_root, 'g', id = sprintf('%s-%s', state_nm, grp_id), 
                transform = sprintf("translate(%s %s) scale(%s %s)", 
                                    trans_x, trans_y, scale_x, scale_y))
}

add_bar_path <- function(svg_root, state_nm, state_data) {
  d <- build_path_from_counts(state_data)
  xml_add_child(svg_root, "path", d = d, id = sprintf('%s-counts', state_nm))
}

add_hover_rects <- function(svg_root, dat, mx = 0, my = 0) {
  dat_bars <- dat %>% 
    mutate(width = 1) %>% # assume 1 year = 1 pixel
    mutate(x_pos = mx + cumsum(width) - width) # Set up x position to start at mx
  
  total_height <- max(dat_bars$n_gages, na.rm = TRUE)
  
  for(y in dat_bars$year) {
    dat_y <- filter(dat_bars, year == y) 
    
    # add a rectangle for each, add style (don't do it this way in real life) and mouseover events, which won't work 
    # because hovertext() as a JS function is not defined
    xml_add_child(svg_root, 'rect', x = dat_y$x_pos, y = -total_height, width=dat_y$width, height=total_height, 
                  style="fill:#0000ff1c",
                  onmouseover = sprintf("hovertext('%s had %s gages in %s', evt)", dat_y$state, dat_y$n_gages, y),
                  onmouseout = "hovertext(' ')")
  }
  
  return(svg_root)
}

build_path_from_counts <- function(dat, mx = 0, my = 0) {
  # Assumes 1 year = 1 pixel (x direction) & 1 gage = 1 pixel (y direction)
  dat_bars <- dat %>% mutate(v = n_gages - lead(n_gages, 1))
  
  v_vec <- c(-head(dat_bars$n_gages, 1), # first vertical distance is the first bar's height but negative to move up
             head(dat_bars$v, -1), # remove the last v bc it will just be NA since there is no `lead` value on the last one
             tail(dat_bars$n_gages, 1)) # add in height of last bar to get back to baseline, positive to move down 
  
  # Build path string with equal widths
  hv_path_str <- paste(paste0("v", v_vec), collapse = sprintf(" h%s ", 1)) # v=vertical, h=horizontal
  sprintf('M%s,%s %sZ', mx, my, hv_path_str)
}

build_state_loc_config <- function() {
  ## based on a 500 x 400 px svg viewBox
  ## these locations were determined manually, outside of R
  tibble(
    state = c('ME','VT','NH','WA','ID','MT','ND','MN','WI','MI','NY','MA','RI','OR','NV','WY','SD','IA','IL',
              'IN','OH','PA','NJ','CT','CA','UT','CO','NE','MO','KY','WV','MD','DE','DC','AZ','NM','KS','AR',
              'TN','VA','NC','SC','OK','LA','MS','AL','GA','TX','FL','AK','HI','PR'), 
    row = c(1, rep(2, 2), rep(3, 10), rep(4, 11), rep(5, 10), rep(6, 8), rep(7, 5), rep(8, 2), rep(9, 3)),
    col = c(11.5, 10.5, 11.5, seq(1, 6, by=1), 7.5, 9.5, 10.5, 11.5, seq(1, 11, by=1), seq(1.5, 10.5, by=1),
            seq(2.5, 9.5, by=1), seq(4, 8, by=1), 4, 9, 1, 2, 11),
    state_chart_width = 41.22, state_chart_height = 41.22, margin = 2.55, margin.top=0.76,
    x = (state_chart_width+margin)*(col-1), y = (state_chart_height+margin)*(row-1)+margin.top)
}
