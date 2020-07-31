library(xml2)
library(dplyr)

####### STILL NEED TO SCIPIPER-IFY THIS #######
# Not doing it yet because I want to get a basic :thumbsup: on what I've got so far from JR
# But just sending the script for review outside of GH will be annoying.

##### Functions #####

init_svg <- function(width = 8, height = 5, ppi = 72) {
  view_box <- sprintf("%s %s %s %s", 0, 0, width*ppi, height*ppi)
  # create the main "parent" svg node. This is the top-level part of the svg
  svg_root <- xml_new_root('svg', viewBox = view_box, preserveAspectRatio="xMidYMid meet", 
                           xmlns="http://www.w3.org/2000/svg", `xmlns:xlink`="http://www.w3.org/1999/xlink", version="1.1" )
  return(svg_root)
}

add_state_grp <- function(svg_root, state_nm, trans_x, trans_y) {
  xml_add_child(svg_root, 'g', id = sprintf('%s-box', state_nm), 
                transform = sprintf("translate(%s, %s)", trans_x, trans_y))
}

add_bar_path <- function(svg_root, state_nm, state_data, round_to = 1) {
  d <- build_path_from_counts(state_data, round_to = round_to)
  xml_add_child(svg_root, "path", d = d, id = sprintf('%s-counts', state_nm))
}

add_hover_rects <- function(svg_root, dat, mx = 0, my = 0, total_width = 100, total_height = 100, round_to = 1) {
  dat_bars <- format_dat_to_bars(dat, total_width, total_height, round_to) %>% 
    mutate(x_pos = mx + cumsum(width) - width) # Set up x position to start at mx
  
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

build_path_from_counts <- function(dat, mx = 0, my = 0, total_width = 100, 
                                   total_height = 100, round_to = 1) {
  
  dat_bars <- format_dat_to_bars(dat, total_width, total_height, round_to)
  dat_svg <- dat_bars %>% mutate(v = height - lead(height, 1)) 
  v_vec <- c(-head(dat_svg$height, 1), # first vertical distance is the first bar's height but negative to move up
             head(dat_svg$v, -1), # remove the last v bc it will just be NA since there is no `lead` value on the last one
             tail(dat_svg$height, 1)) # add in height of last bar to get back to baseline, positive to move down 
  
  # Build path string with equal widths
  hv_path_str <- paste(paste0("v", v_vec), collapse = sprintf(" h%s ", unique(dat_bars$width))) # v=vertical, h=horizontal
  sprintf('M%s,%s %sZ', mx, my, hv_path_str)
}

format_dat_to_bars <- function(dat, total_width, total_height, round_to) {
  
  width_ea <- round(total_width / length(unique(dat$year)), digits = round_to)
  n_range <- c(0, max(dat$n_gages))
  
  dat %>% 
    ungroup() %>% # just in case it's grouped (causes weird issues)
    mutate(height = calc_bar_height(n_gages, n_range, total_height, round_to),
           width = width_ea) 
  
}

calc_bar_height <- function(this_n, n_range, svg_height, round_digits = 1) {
  round(approx(n_range, c(0, svg_height), this_n)$y, digits = round_digits)
}

##### Build SVG #####

# Config
svg_fp <- "example_svg.svg"
decimal_to_round <- 1

# state_loc <- tibble(state = c("VA", "WI"), x = c(200, 75), y = c(400, 135))
# state_dat <- tibble(year = rep(1990:1992, 2), state = c(rep("VA", 3), rep("WI", 3)), n_gages = c(2,5,3,7,9,14))
state_dat <- readRDS("gage_counts_by_state.rds") %>% 
  rename(n_gages = n_gages_per_year) %>% # shorten for now to match what was used in the code
  filter(!is.na(year), !is.na(state), !is.na(n_gages))

# Make a fake version for now:
state_loc <- tibble(
  state = state.abb,
  x = round(approx(range(state.center$x), c(0,576), state.center$x)$y),
  y = round(approx(range(state.center$y), c(360, 0), state.center$y)$y)
) %>% 
  bind_rows(tibble(state = c("DC", "PR"), x = c(550, 500), y = c(163, 360)))

  
# Create whole SVG 
svg_root <- init_svg()

##### State-specific #####

states <- unique(state_dat$state)

for(st in states) {
  state_nm <- state.name[which(state.abb == st)]
  message(st)
  # Prepare state data
  st_dat <- filter(state_dat, state == st)
  st_pos <- filter(state_loc, state == st)
  
  st_path <- svg_root %>% 
    # create a group for the state of VA
    add_state_grp(state_nm, trans_x = st_pos$x, trans_y = st_pos$y) %>% 
    # add the path for the VA-specific bars
    add_bar_path(state_nm, st_dat, decimal_to_round) %>% 
    add_hover_rects(st_dat)
}

##### Write out final SVG to file #####

xml2::write_xml(svg_root, file = svg_fp)
