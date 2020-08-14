
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
  
  # Add a title and text + arrow for instructions about hovering
  add_title(svg_root)
  add_tooltip_instructions(svg_root)
  
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
  view_box <- sprintf("%s %s %s %s", 0, -50, ifelse(is_pixels, width, width*ppi), ifelse(is_pixels, height, height*ppi))
  # create the main "parent" svg node. This is the top-level part of the svg
  svg_root <- xml_new_root('svg', viewBox = view_box, preserveAspectRatio="xMidYMid meet", id = "cartogram-svg",
                           xmlns="http://www.w3.org/2000/svg", `xmlns:xlink`="http://www.w3.org/1999/xlink", 
                           version="1.1" )
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
      add_state_grp(state_nm, trans_x = st_pos$x, trans_y = st_pos$y, grp_id = "bars") %>% 
      # add the path for the VA-specific bars
      add_bar_path(state_nm, st_dat, scale_x = scale_width, scale_y = scale_height) %>% 
      add_state_txt(state_nm, st_dat, scale_x = scale_width)
    
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
      add_state_grp(state_nm, trans_x = st_pos$x, trans_y = st_pos$y, grp_id = "hovers") %>% 
      add_hover_rects(st_dat, state_nm, scale_x = scale_width, scale_y = scale_height)
  }
  
}

add_state_grp <- function(svg_root, state_nm, trans_x, trans_y, grp_id = "box") {
  xml_add_child(svg_root, 'g', id = sprintf('%s-%s', state_nm, grp_id), 
                transform = sprintf("translate(%s %s)", trans_x, trans_y))
}

add_bar_path <- function(svg_root, state_nm, state_data, scale_x = 1, scale_y = 1) {
  d <- build_path_from_counts(state_data)
  xml_add_child(svg_root, "path", d = d, id = sprintf('%s-counts', state_nm), 
                class = "state-trend",
                transform = sprintf("scale(%s %s)", scale_x, scale_y))
}

add_state_txt <- function(svg_root, state_nm, state_data, scale_x = 1) {
    xml_add_sibling(svg_root, "text", unique(state_data$state), 
                    class = "state-label", 
                    y = "0", x = as.character(nrow(state_data)*scale_x))
}

add_hover_rects <- function(svg_root, dat, state_nm, mx = 0, my = 0, scale_x = 1, scale_y = 1) {
  dat_bars <- dat %>% 
    mutate(width = 1) %>% # assume 1 year = 1 pixel
    mutate(x_pos = mx + cumsum(width) - width) # Set up x position to start at mx
  
  total_height <- max(dat_bars$n_gages, na.rm = TRUE)
  
  data_json <- jsonlite::toJSON(list(n_gages = dat_bars$n_gages,
                        start_year = min(dat_bars$year)))
  
  xml_add_child(svg_root, 'rect', id = sprintf("%s-mouse", state_nm),
                x = min(dat_bars$x_pos), y = -total_height, 
                width=sum(dat_bars$width), height=total_height,
                class="state-mousers", transform = sprintf("scale(%s %s)", scale_x, scale_y),
                #onmousemove = "gagetip(evt)", onmouseout = "gagetip()", # This is what regular JS needs
                `@mousemove` = "gagetip($event)", `@mouseout` = "gagetip()", # This is what Vue needs
                data = data_json)
  
  return(svg_root)
}

add_title <- function(svg_root) {
  
  svg_root %>% 
    xml_add_child("text", id = "title-svg", transform = "translate(0 0)",
                  style = "font-size: 10px; font-style: italic; fill: rgb(139, 139, 139);",
                  "State-level trends in USGS streamgaging") %>% 
    xml_add_child("tspan", x=0, y=15, "from 1890 to present")
  
}

add_tooltip_instructions <- function(svg_root) {
  
  # Add tooltip text
  svg_root %>% 
    xml_add_child("text", id = "annotate-svg", transform = "translate(175 325)",
                  style = "font-size: 10px; font-style: italic; fill: rgb(139, 139, 139);") %>% 
    xml_add_child("tspan", x=0, y=0, "Hover to see the number of") %>% 
    xml_add_sibling("tspan", x=0, y=10, "streamgages in each state")
  
  # Add tooltip arrow
  svg_root %>% 
    xml_add_child("path", id = "annotate-arrow", transform = "translate(-142 -73)",
                  d = "M446.47,402.11c-4.39-1.79,20.07,6.55,37.58.86a23.33,23.33,0,0,0,13.86-11.4l3,9.16L499.15,390l-11.31-.56,10.07,2.16")
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
