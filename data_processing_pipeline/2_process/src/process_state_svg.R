
process_state_svg <- function(target_name, site_locations_file, bar_xml_file, 
                              states_sp, watermark, svg_title, svg_alttext, 
                              site_chunk_n, site_chunk_nm_pattern) {
  
  sites <- readRDS(site_locations_file)
  bars.xml <- read_xml(bar_xml_file)
  
  state.name <- as.character(row.names(states_sp)[states_sp@plotOrder])
  site.num <- sites$site_no # note that points sp objects don't have `plotOrder`, so we need to verify this
  
  size <- size_svg_map(states_sp)
  svg <- svglite::xmlSVG({
    par(mai=c(0,0,0,0), omi=c(0,0,0,0))
    sp::plot(states_sp, ylim=bbox(states_sp)[2,], xlim=bbox(states_sp)[1,], setParUsrBB = TRUE)
    sp::plot(sites, add=TRUE, pch = 20, col='red')
  }, width = size[1], height = size[2])
  
  svg <- clean_up_svg(svg, id = 'map-svg', 
                      title = svg_title, 
                      desc = svg_alttext)
  vb.num <- as.numeric(strsplit(xml_attr(svg, 'viewBox'),'[ ]')[[1]])
  p <- xml_find_all(svg, '//*[local-name()="path"]')
  c <- xml_find_all(svg, '//*[local-name()="circle"]')
  xml_remove(p)
  xml_remove(c)
  if (length(p) != (length(states_sp))){
    stop('something is wrong, the number of states and polys is different')
  }
  if (length(c) != (length(sites))){
    stop('something is wrong, the number of sites and circles is different')
  }
  
  defs <- xml_add_child(svg, 'defs')
  
  g.states <- xml_add_child(svg, 'g', 'id' = 'state-polygons')
  g.sites <- xml_add_child(svg, 'g', 'id' = 'site-dots')
  g.watermark <- xml_add_child(svg, 'g', id='usgs-watermark', 
                               transform = sprintf('translate(50,%s)scale(0.20)', as.character(vb.num[4]-3)))
  
  
  for (i in 1:length(state.name)){
    id.name <- gsub(state.name[i], pattern = '[ ]', replacement = '_')
    class <- ifelse(state.name[i] %in% c('AK','HI','PR'), 'exterior-state','interior-state')
    xml_add_child(g.states, 'path', d = xml_attr(p[i], 'd'), id=id.name, class=class)
  }
  rm(p)
  
  library(dplyr)
  
  cxs <- as.numeric(xml_attr(c, 'cx')) %>% round(0) %>% as.character()
  cys <- as.numeric(xml_attr(c, 'cy')) %>% round(0) %>% as.character()
  
  chunk.s <- seq(1,by=site_chunk_n, to=length(cxs))
  chunk.e <- c(tail(chunk.s, -1L), length(cxs))
  if (tail(chunk.e,1) == tail(chunk.s,1)) stop("can't handle this case")
  
  for (i in 1:length(chunk.s)){
    xml_add_child(g.sites, 'path', 
                  d = paste("M",cxs[chunk.s[i]:chunk.e[i]], " ",  cys[chunk.s[i]:chunk.e[i]], "v0", collapse="", sep=''), 
                  id=sprintf(site_chunk_nm_pattern, i), class='site-dot')
  }
  
  rm(c)
  
  xml_add_child(g.watermark,'path', d=watermark[['usgs']], onclick="window.open('https://www2.usgs.gov/water/','_blank')", 'class'='watermark')
  xml_add_child(g.watermark,'path', d=watermark[['wave']], onclick="window.open('https://www2.usgs.gov/water/','_blank')", 'class'='watermark')
  
  svg <- add_bar_chart(svg, bars.xml)
  write_xml(svg, target_name)
  
}

add_bar_chart <- function(svg, bars){
  
  vb <- as.numeric(strsplit(xml_attr(svg, "viewBox"), '[ ]')[[1]])
  ax.buff <- 5
  all.bars <- xml_children(xml_children(bars)[1])
  all.mousers <- xml_children(xml_children(bars)[2])
  last.attrs <- tail(all.bars, 1) %>% xml_attrs() %>% .[[1]] 
  full.width <- as.numeric(last.attrs[['x']]) + as.numeric(last.attrs[['width']])
  xml_attr(bars, 'transform') <- sprintf("translate(%s,%s)", vb[3]-full.width, vb[4])
  
  text.path <- paste0(xml_attr(all.bars, 'x'), ',', xml_attr(all.bars, 'y')) %>% 
    paste("L", collapse=' ') %>% paste0('M', .)
  
  xml_find_all(svg, '//*[local-name()="defs"]') %>% 
    xml_add_child('path', id = 'flowing-text-path', d=text.path)
  
  heights <- all.bars %>% xml_attr('height') %>% as.numeric()
  h <- max(heights)
  max.i <- which(h == heights)[1]
  # this is a hack to get the gage count from the element. Brittle:
  gage.meta <- xml_attr(all.mousers, 'onmousemove') %>% 
    stringr::str_extract_all("\\(?[0-9.]+\\)?")
  years <-  lapply(gage.meta,function(x) x[2]) %>% unlist
  max.gages <- gage.meta[[max.i]] %>% .[1] %>% as.numeric
  
  y.tick.labs <- pretty(c(0,max.gages))[pretty(c(0,max.gages)) < max.gages]
  y.ticks <- (h+ax.buff-round(y.tick.labs*h/max.gages,1)) %>% as.character()
  x.tick.labs <- seq(1800,2020, by=10) %>% as.character()
  
  
  vb[4] <- vb[4] + h + ax.buff + 20 # last part for the axis text
  xml_attr(svg, "viewBox") <- paste(vb, collapse=' ')
  g.axes <- xml_add_child(bars, 'g', id='axes', .where = 1)
  xml_add_child(g.axes, 'path', d=sprintf("M-%s,%s v%s", ax.buff, "0", h+ax.buff), id='y-axis', stroke='black')
  xml_add_child(g.axes, 'path', d=sprintf("M-%s,%s h%s", ax.buff, h+ax.buff, ax.buff+full.width), id='x-axis', stroke='black')
  g.c <- xml_add_child(g.axes, 'g', id = 'context-label', transform='translate(0,-4)')
  g.y <- xml_add_child(g.axes, 'g', id = 'y-axis-labels', class='axis-labels svg-text')
  g.x <- xml_add_child(g.axes, 'g', id = 'x-axis-labels', class='axis-labels svg-text')
  for (i in 1:length(y.ticks)){
    xml_add_child(g.y, 'text', y.tick.labs[i], y = y.ticks[i], 
                  x=as.character(-ax.buff), 'text-anchor' = 'end', dx = "-0.33em")
  }
  for (year in x.tick.labs){
    use.i <- which(years == year)
    if (length(use.i) > 0){
      attrs <- xml_attrs(all.mousers[[use.i[1]]])
      xml_add_child(g.x, 'text', year, y = as.character(h+ax.buff), 
                    x=as.character(as.numeric(attrs[['x']])+as.numeric(attrs[['width']])/2), 
                    'text-anchor' = 'middle', dy = "1.0em")
    }
  }
  
  xml_add_child(g.c, 'text', 'letter-spacing'="1.8", class='context-label svg-text') %>% 
    xml_add_child('textPath', 'xlink:href'='#flowing-text-path', startOffset="3.3%", 'Number of active gages through time') 
  
  xml_add_child(svg, bars)
  return(svg)
}

# Helpers
size_svg_map <- function(sp) {
  apply(sp::bbox(sp), 1, diff)/500000
}

#' do the things to the svg that we need to do every time if they come from svglite:
#' 
#' @param svg the svglite xml object from svglite
#' 
#' @return a modified version of svg
clean_up_svg <- function(svg, desc, title, id){
  # let this thing scale:
  xml_attr(svg, "preserveAspectRatio") <- "xMidYMid meet"
  xml_attr(svg, "xmlns") <- 'http://www.w3.org/2000/svg'
  xml_attr(svg, "xmlns:xlink") <- 'http://www.w3.org/1999/xlink'
  xml_attr(svg, "id") <- id # viz[["id"]]
  
  r <- xml_find_all(svg, '//*[local-name()="rect"]')
  
  xml_add_sibling(xml_children(svg)[[1]], 'desc', .where='before', desc) 
  xml_add_sibling(xml_children(svg)[[1]], 'title', .where='before', title) 
  
  defs <- xml_find_all(svg, '//*[local-name()="defs"]')
  # !!---- use these lines when we have css for the svg ---!!
  xml_remove(defs)
  
  # clean up junk that svglite adds:
  .junk <- lapply(r, xml_remove)
  return(svg)
}
