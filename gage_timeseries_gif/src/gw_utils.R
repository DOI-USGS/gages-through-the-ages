# Function (by Joe Zemmels) to download information for gw sites
# 
#
# 
fetch_gw_sites <- function(){
  
  gw_sites <-
    purrr::map_dfr(state.abb,
                   function(abb){
                     
                     purrr::map_dfr(c("62611", "72019", "62610", "72150", "72019"),
                                    function(pcode){
                                      
                                      ret <- purrr::possibly(dataRetrieval::whatNWISsites)(
                                        stateCd = abb,
                                        parameterCd = pcode)
                                      
                                      if(!is.null(ret)){
                                        ret |>
                                          mutate(state = abb,
                                                 param = pcode) 
                                      }
                                      
                                    })
                     
                   })
  
  gw_sites 
}


#' take map arguments and return a projected sf object
#' 
#' @param area_name name of the spatial extent for mapping
#' @param site_info the metadata including locations for gages
#' 
extract_gw_sites <- function(area_name, site_info){
  
  # projection code look up for non-CONUS regions
  crs_map <- c(AK = 3338, HI = 6633)
  
  if(area_name == "CONUS") {
    
    sites_out <- site_info %>% 
      filter(! state %in% names(crs_map)) |>
      points_sp() |> # (this function is in map_utils.R)
      sf::st_as_sf() |>
      sf::st_transform(crs = 5070) 
    
  } else if(area_name != "CONUS") {
    
    sites_out <- site_info %>% 
      filter(state == area_name) |>
      points_sp() |>
      sf::st_as_sf() |>
      sf::st_transform(crs = crs_map[[area_name]]) 
  }
  
  return(sites_out)
}


#' Process the raw data to prepare it for pie charts
#' 
#' @param in_df the raw data for pie charts
#' @param breakdown_type chr, "federal" "non-federal" or "overview" to indicate
#' which type of data to analyze. federal = non-USGS federal, overview = all cooperator
#' types
process_for_pie <- function(in_df,
                            breakdown_type){
  
  
  if(breakdown_type == "overview"){
    out_df <- in_df |>
      count(agency_general, name = "total_sites") |>
      mutate(x = "x") |>
      mutate(general_name = agency_general)
  }
  
  if(breakdown_type == "federal"){
    # pre-plotting analysis
    out_df <- in_df |>
      filter(agency_general == "Other Federal") |>
      count(agency_cd, party_nm, name = "numb_of_sites") |>
      mutate(general_name = case_when(numb_of_sites < 30 ~ "Other",
                                      TRUE ~ party_nm)) |>
      group_by(general_name) |>
      summarize(total_sites = sum(numb_of_sites, na.rm = TRUE)) |>
      mutate(x = "x") |>
      mutate(general_name = factor(general_name, 
                                   labels = c("US Soil Conservation Service",
                                              "US Navy",
                                              "US EPA",
                                              "US Army Corps of Engineers",
                                              "Other"), 
                                   levels = c("U.S. Soil Conservation Service",
                                              "U.S. Navy Department",
                                              "U.S. Environmental Protection Agency",
                                              "U.S. Army Corps of Engineers",
                                              "Other")))
  } else if(breakdown_type == "non-federal") {
    out_df <- in_df |>
      filter(agency_general == "Non-Federal") |>
      count(party_nm, name = "numb_of_sites") |>
      # generalize a bit
      mutate(general_name = case_when(numb_of_sites < 1000 ~ "Other",
                                      TRUE ~ party_nm) ) |>
      group_by(general_name) |>
      summarize(total_sites = sum(numb_of_sites, na.rm = TRUE)) |>
      mutate(x = "x") |>
      mutate(general_name = factor(general_name, 
                                   levels = c("Minnesota Geological Survey",
                                              "Texas Water Development Board",
                                              "Arizona Department of Water Resources",
                                              "Indiana Department of Natural Resources",
                                              "Other"),
                                   labels = c("MN Geological Survey",
                                              "TX Water Development Board",
                                              "AZ Dept. of Natural Resources",
                                              "IN Dept. of Natural Resources",
                                              "Other"))) |>
      arrange(general_name)
  } 
  
  return(out_df)
}

#' Create pie charts
#' 
#' @param in_df the raw data for pie charts
#' @param breakdown_type chr, "federal" "non-federal" or "overview" to indicate
#' which type of data to analyze. federal = non-USGS federal, overview = all cooperator
#' types
plot_gw_piechart <- function(in_df,
                             breakdown_type){
  
  # specifics for plotting based on breakdown_type
  if(breakdown_type == "federal"){
    direction = 1
    start = 0.5
    colors = c(red_color,
               lighter_red,
               lighter_red2,
               lighter_red3)
  } else if(breakdown_type == "non-federal"){
    direction = 1
    start = 0.5
    colors = c(teal_color, 
               teal_dark,
               teal_med,
               teal_light,
               grey_light)
  } else if(breakdown_type == "overview"){
    direction = -1
    start = 0
    colors = c(teal_color,
               red_color,
               blue_color)
  }
  
  ggplot(in_df) +
    geom_bar(aes(y = total_sites, x = x, fill = general_name), 
             stat = "identity", position = "fill", 
             linewidth = 1) +
    coord_polar(theta = "y", 
                direction = direction, 
                start = start) +
    theme_void() + 
    scale_fill_manual(values = colors) +
    theme(legend.position = "none")
  
}

#' Plot map of active gw sites
#' 
#' @param gw_sf long form, gw sites as sf
#' @param yr year being shown
#' @param state_map projected states and territories
plot_gw_map <- function(gw_sf, yr, state_map){
  
  
  # plot map
  gage_map <- gw_sf |>
    ggplot() +
    # base map
    geom_sf(data = state_map, fill = grey_light,
            linewidth = 0.25, color = 'white') +
    # USGS sites
    geom_sf(data = gw_sf |> filter(agency_general == "USGS"),
            color = blue_color,
            size = 0.01, alpha = 0.5, pch = 20) +
    # Non-federal sites, plotted on top to avoid overfitting, with a white mask to help
    # for contrast
    geom_sf(data = gw_sf |> filter(agency_general == "Non-Federal"),
            color = "white",
            size = 0.01, alpha = 1, pch = 20) +
    geom_sf(data = gw_sf |> filter(agency_general == "Non-Federal"),
            color = teal_color,
            size = 0.01, alpha = 0.5, pch = 20) +
    # other non-USGS federal sites, plotted on top to avoid overfitting, with a white mask to help
    # for contrast
    geom_sf(data = gw_sf |> filter(agency_general == "Other Federal"),
            color = "white",
            size = 0.01, alpha = 1, pch = 20) +
    geom_sf(data = gw_sf |> filter(agency_general == "Other Federal"),
            color = red_color,
            size = 0.01, alpha = 0.5, pch = 20) +
    theme_void() +
    theme(legend.position = "none")
  
  return(gage_map)
  
}




#' Compose the chart elements
#' 
#' @param gw_map_AK the map of active gw sites in Alaska
#' @param gw_map_HI the map of active gw sites in Hawaii
#' @param gw_map_CONUS the map of active gw sites in lower 48
#' @param pie_all the pie chart with all cooperator types
#' @param pie_nonfed the pie chart with top non-federal cooperators
#' @param pie_fed the pie chart with top non-USGS federal cooperators
#' @param yr year data was pulled for
#' @param png_out the name of the resultant png
#' @param overall_agencies the breakdown of cooperators by agency types
#' @param gw_raw the distinct groundwater sites (df) for annotations
compose_gw_chart <- function(
    gw_map_CONUS, 
    gw_map_AK, 
    gw_map_HI, 
    pie_all,
    pie_nonfed,
    pie_fed,
    yr,
    png_out,
    overall_agencies,
    gw_raw){
  
  
  # base composition for both standalone and gif
  base_plot <- ggdraw(xlim = c(0, 1), 
                      ylim = c(0, 1)) +
    # create background canvas
    draw_grob(grid::rectGrob(
      x = 0, y = 0, 
      width = 2, height = 2,
      gp = grid::gpar(fill = 'white', alpha = 1, col = 'white')
    )) +
    draw_plot(
      gw_map_CONUS,
      x = -0.02,
      y = 0.12,
      width = 1.03
    ) +
    # add overall pie chart
    draw_plot(pie_all,
              x = 0.4, y = -0.38, width = 0.23,
              hjust = 0.5) +
    # add non-federal pie chart
    draw_plot(pie_nonfed,
              x = 0.53, y = -0.255, width = 0.18) +
    # add federal pie chart
    draw_plot(pie_fed,
              x = 0.635, y = -0.44, width = 0.13) +
    draw_text("Alaska",
              x = 0.17, y = 0.27,
              color = grey_dark,
              family = font_fam, size = 7) +
    draw_plot(
      gw_map_AK,
      x = -0.40,
      y = 0.24,
      height = 0.23
    ) +
    draw_plot(
      gw_map_HI,
      x = -0.27,
      y = 0.27,
      height = 0.25
    ) +
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
    draw_text(sprintf("Groundwater Monitoring Sites, %s", yr),
              x = 0.025, y = 0.973,
              hjust = 0, vjust = 1,
              family = font_fam,
              size = 18) +
    # information about pie charts
    draw_text(sprintf("USGS Water serves \ngroundwater level data\nto the public from\n%s\nmonitoring sites", scales::comma(nrow(gw_raw))),
              x = 0.025, y = 0.2, hjust = 0, vjust = 1, family = font_fam, size = 10) +
    draw_text(sprintf("USGS-collected\n(%s sites)", 
                      scales::comma(overall_agencies |> 
                                      filter(agency_general == "USGS") |> 
                                      pull(total_sites))), lineheight = 0.8,
              color = "white",
              x = 0.4, y = 0.1, hjust = 0.5, vjust = 1, 
              family = font_fam, size = 7, fontface = "bold") +
    draw_line(x = c(0.43, 0.43, 0.545),
              y = c(0.22, 0.24, 0.28), linewidth = 0.2) +
    draw_text(sprintf("Non-Federally collected\n(%s sites)", 
                      scales::comma(overall_agencies |> 
                                      filter(agency_general == "Non-Federal") |> 
                                      pull(total_sites))), lineheight = 0.8, 
              x = 0.635, y = 0.36,
              hjust = 0.5, vjust = 1, family = font_fam, size = 7, fontface = "bold") +
    draw_line(x = c(0.4600, 0.46, 0.64),
              y = c(0.20, 0.22, 0.07), linewidth = 0.2) +
    draw_text(sprintf("Other Federal Agency collected\n(%s sites)", 
                      scales::comma(overall_agencies |> 
                                      filter(agency_general == "Other Federal") |> 
                                      pull(total_sites))), lineheight = 0.8, 
              x = 0.705, y = 0.15,
              hjust = 0.5, vjust = 1, family = font_fam, size = 7, fontface = "bold") +
    draw_text("Minnesota Geological Survey", x = 0.68, y = 0.200,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("Texas Water Development Board", x = 0.7, y = 0.25,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("Arizona Dept. of Natural Resources", x = 0.69, y = 0.29,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("Indiana Dept. of Natural Resources", x = 0.68, y = 0.305,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("Other non-Federal entity", x = 0.665, y = 0.32,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("U.S. Soil Conservation Service", x = 0.755, y = 0.045,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("U.S. Navy", x = 0.76, y = 0.075,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("Environmental Protection Agency", x = 0.745, y = 0.1,
              hjust = 0, vjust = 1, family = font_fam, size = 6) +
    draw_text("Other Federal Agency", x = 0.73, y = 0.115,
              hjust = 0, vjust = 1, family = font_fam, size = 6)
  
  ggsave(png_out, 
         width = 5, height = 5, dpi = 300, units = 'in')
  
  return(png_out)
  
}
