export default{
    methodContent: {
        methods:[
            {
                'title': 'Digitization of historic urban extents',
                'method': 'Using an ArcToolbox tool, "PDF to TIFF Conversion Tool", convert each separate page of the provided PDF into a geotiff format "TIF file" that can be imported as a raster layer into ArcMap 10.7. After adding the TIF file into the current GIS project, use the Georeferencing tool "Fit to Display" to pull the raster into the area of interest and using the Georeferencing tool "Add Control Points" identify and lay down several control points that will tie the non-geospatial TIF image to actual locations on the ground. This stretches the raster into the current GIS projection, which is set at EPSG:3857. After successfully aligning the TIF to the geospatial extent of interest, create a new empty shapefile, and use the Create Features toolset to manually trace polygons over the urban areas depicted in the original PDF.'
            },
            {
                'title': 'Calculating USGS stream gages',
                'method': 'To calculate the annual number of active USGS stream gages, an inventory of the USGS National Water Information System was completed using an <a href="https://github.com/USGS-R/national-flow-observations" target="_blank">R-based reproducible data pipeline called national-flow-observations</a>. For the purposes of this visualization, "active" gages are considered those with at least 335 days of data every year.'
            },
            {
                'title': 'Determining if a gage is urban or non-urban',
                'method': 'To determine whether a stream gage is in an urban or rural area, we used urban extent spatial data ' +
                            'from the U.S. Census Bureau for years closest to our years of interest (1967 and 2019). For the spatial ' +
                            'extents used in the 1967 visual, we digitized maps from the <a href="https://www2.census.gov/library/publications/decennial/1970/pc-s1-supplementary-reports/pc-s1-108ch2.pdf" target="_blank">1970 US Census Bureau report on urbanized areas ' + 
                            'in the United States.</a> For the spatial extents used in the 2018 visual, we used <a href="https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html" target="_blank">cartographic boundary files for 2018 urban areas from the US Census Bureau</a>. ' + 
                            'Using the urban extent spatial data and the USGS stream gage location data, we used point-in-polygon methods in R to '  +
                            'determine if a stream gage was inside or outside of an urbanized area. Those methods can be found in <a href="https://github.com/usgs-makerspace/gages-through-the-ages/tree/master/data_processing_pipeline" target="_blank">this data processing pipeline</a>. '
            }
        ]
    }
}