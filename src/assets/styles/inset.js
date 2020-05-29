export default {
    style: {
        version: 8,
        sources: {
            basemap: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/misctilesets/usstatecounties/{z}/{x}/{y}.pbf'],
                'minzoom': 2, // setting this to equal the minzoom of main map, real tile extent is 2
                'maxzoom': 6  // setting this to equal the maxzoom of main map, real tile extent is 10
            },
            georgiaUrbanExtent: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/misctilesets/gaUrbanExtent/{z}/{x}/{y}.pbf'],
                'minzoom': 0, // setting this to equal the minzoom of main map, real tile extent is 2
                'maxzoom': 14  // setting this to equal the maxzoom of main map, real tile extent is 10
            }
        },
        'sprite': '',
        'glyphs': 'https://orangemug.github.io/font-glyphs/glyphs/{fontstack}/{range}.pbf',
        'layers': [
            {
                'id': 'background',
                'paint': {
                    'background-color': 'rgb(181,193,200)'
                },
                'type': 'background'
            },
            {   
                'id': 'statesFill',
                'type': 'fill',
                'source': 'basemap',
                'source-layer': 'states',
                'minzoom': 2,
                'maxzoom': 24,
                'layout': {
                    'visibility': 'visible'
                },
                'paint': {
                    'fill-color': 'rgb(228,228,227)'
                }
            },
            {
                'filter': ['all', ['!=', 'NAME', 'Florida'], ['!=', 'NAME', 'Louisiana']],
                'id': 'statesOutline',
                'type': 'line',
                'source': 'basemap',
                'source-layer': 'states',
                'minzoom': 2,
                'maxzoom': 24,
                'layout': {
                    'visibility': 'visible'
                },
                'paint': {
                    'line-color': 'rgb(255,255,255)',
                    'line-width': .5
                }
            }
        ]
    }
}
