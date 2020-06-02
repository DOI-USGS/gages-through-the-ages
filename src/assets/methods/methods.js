export default{
    methodContent: {
        methods:[
            {
                'title': 'Digitization of historic urban extents',
                'method': 'Using an ArcToolbox tool, "PDF to TIFF Conversion Tool", convert each separate page of the provided PDF into a geotiff format "TIF file" that can be imported as a raster layer into ArcMap 10.7. After adding the TIF file into the current GIS project, use the Georeferencing tool "Fit to Display" to pull the raster into the area of interest and using the Georeferencing tool "Add Control Points" identify and lay down several control points that will tie the non-geospatial TIF image to actual locations on the ground. This stretches the raster into the current GIS projection, which is set at EPSG:3857. After successfully aligning the TIF to the geospatial extent of interest, create a new empty shapefile, and use the Create Features toolset to manually trace polygons over the urban areas depicted in the original PDF.'
            },
            {
                'title': 'Example',
                'method': 'Method content goes here.'
            }
        ]
    }
}