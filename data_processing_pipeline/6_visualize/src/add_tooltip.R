insert_tooltip <- function(xml_doc) {
  
  # Find location of last bar group start, then add 2 to get to the closing </g>
  last_bar <- tail(grep("-bars", xml_doc), 1) + 3
  
  # Now find start of first hover (should be last_bar + 1)
  first_hover <- head(grep("-hovers", xml_doc), 1)
  
  # Now reconstruct to fit this tool tip code in between those
  tooltip <- c(
    '<rect id="tooltip_bg" height="32" class="hidden"/>',
    ' <g id="tool_pt" class="hidden">',
    '  <defs>',
    '   <clipPath id="tip-clip">',
    '    <rect x="-8" width="16" y="-9.5" height="11"/>',
    '   </clipPath>',
    '  </defs>',
    ' <path d="M-6,-10 l6,10 l6,-10" class="tooltip-box" clip-path="url(#tip-clip)"/>',
    ' </g>',
    '<text id="tooltip" stroke="none" dy="-15" fill="#000000" text-anchor="middle" class="sub-label"> </text>'
  )
  
  c(head(xml_doc, last_bar), tooltip, xml_doc[first_hover:length(xml_doc)])
  
}

add_tooltip_to_xml <- function(target_name, xml_file) {
  readLines(xml_file) %>% 
    insert_tooltip() %>% 
    writeLines(target_name)
}
