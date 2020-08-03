library(xml2)
library(dplyr)

####### STILL NEED TO SCIPIPER-IFY THIS #######
# Not doing it yet because I want to get a basic :thumbsup: on what I've got so far from JR
# But just sending the script for review outside of GH will be annoying.

##### Functions #####

prepare_svg_data <- function(raw_dat, start_yr, end_yr) {
  # Expect certain column names coming in
  stopifnot(all(c("year", "state", "n_gages") %in% names(raw_dat)))
  
  dat <- raw_dat %>% 
    ungroup() %>% # just in case it's grouped (causes weird issues)
    # Remove potential missing info
    filter(!is.na(year), !is.na(state), !is.na(n_gages)) %>% 
    filter(year %in% start_yr:end_yr)
  
  # Fill in missing years with 0s
  expand.grid(state = unique(raw_dat$state), year = start_yr:end_yr) %>% 
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

add_state_grp <- function(svg_root, state_nm, trans_x, trans_y, scale_x = 1, scale_y = 1) {
  xml_add_child(svg_root, 'g', id = sprintf('%s-box', state_nm), 
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
    xml_add_sibling(svg_root, 'rect', x = dat_y$x_pos, y = -total_height, width=dat_y$width, height=total_height, 
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

##### Build SVG #####

# Config
svg_fp <- "example_svg.svg"

start_yr <- 1889
end_yr <- 2019

pixel_width <- 500
pixel_height <- 400

width_of_each_state <- 15
height_of_each_state <- 15

# Data inputs:
state_dat_raw <- readRDS("gage_counts_by_state.rds") %>% 
  rename(n_gages = n_gages_per_year) # shorten for now to match what was used in the code
  
# Make a fake version for now:
state_loc <- tibble(
  state = state.abb,
  x = round(approx(range(state.center$x), c(0,576), state.center$x)$y),
  y = round(approx(range(state.center$y), c(360, 0), state.center$y)$y)
) %>% 
  bind_rows(tibble(state = c("DC", "PR"), x = c(550, 500), y = c(163, 360)))

## Everything below here would happen inside of a fxn/task

# Create whole SVG 
svg_root <- init_svg(pixel_width, pixel_height, is_pixels = TRUE)

# Prepare data & setup configs based on data
state_dat <- prepare_svg_data(state_dat_raw, start_yr, end_yr)

states <- unique(state_dat$state)
scale_width <- width_of_each_state / length(start_yr:end_yr)   

##### State-specific #####

for(st in states) {
  state_nm <- state.name[which(state.abb == st)]
  message(st)
  # Prepare state data
  st_dat <- filter(state_dat, state == st)
  st_pos <- filter(state_loc, state == st)
  
  # Height scale differs for each state because their max 
  # bar height differs
  scale_height <- height_of_each_state / max(st_dat$n_gages)
  
  st_path <- svg_root %>% 
    # create a group for the state of VA
    add_state_grp(state_nm, trans_x = st_pos$x, trans_y = st_pos$y,
                  scale_x = scale_width, scale_y = scale_height) %>% 
    # add the path for the VA-specific bars
    add_bar_path(state_nm, st_dat) %>% 
    add_hover_rects(st_dat)
}

##### Write out final SVG to file #####

xml2::write_xml(svg_root, file = svg_fp)
