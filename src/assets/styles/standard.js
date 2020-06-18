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
            stateNames: {
                type: 'geojson',
                'data': 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/stateNames/stateNames.json'
            },
            waterbody: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/waterbody/{z}/{x}/{y}.pbf'],
                'minzoom': 3, // setting this to equal the minzoom of main map, real tile extent is 2
                'maxzoom': 9  // setting this to equal the maxzoom of main map, real tile extent is 10
            },
            streams: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/streams/{z}/{x}/{y}.pbf'],
                'minzoom': 3, // setting this to equal the minzoom of main map, real tile extent is 2
                'maxzoom': 9  // setting this to equal the maxzoom of main map, real tile extent is 10
            },
            openmaptiles: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/openmaptiles/baselayers/{z}/{x}/{y}.pbf'],
                'minzoom': 2,
                'maxzoom': 14
            },
            hillshade: {
                type: 'raster',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/openmaptiles/omthillshade/{z}/{x}/{y}.png'],
                'minzoom': 2,
                'maxzoom': 12,
                'tileSize': 256
            },
            nhd_streams_grouped: {
                type: 'vector',
                'tiles':['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/nhdstreams_grouped/{z}/{x}/{y}.pbf'],
                'minzoom': 2, // setting this to equal the minzoom of main map, real tile extent is 0
                'maxzoom': 6  // setting this to equal the maxzoom of main map, real tile extent is 10
            }
        },
        'sprite': '',
        'glyphs': 'https://orangemug.github.io/font-glyphs/glyphs/{fontstack}/{range}.pbf',
        'layers': [
            {
                'id': 'background',
                'paint': {
                    'background-color': 'rgb(228,228,227)'
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
                'filter': ['all', ['!=', 'Strahler', 1]],
                'id': 'streams',
                'type': 'line',
                'source': 'streams',
                'source-layer': 'stream',
                'paint': {
                    'line-color': 'rgb(181,193,200)',
                    'line-width': [
                        'case',
                        ['==',['get', 'Strahler'], 7], 3,
                        ['==',['get', 'Strahler'], 6], 2.5,
                        ['==',['get', 'Strahler'], 5], 2,
                        ['==',['get', 'Strahler'], 4], 1.5,
                        ['==',['get', 'Strahler'], 3], 1,
                        ['==',['get', 'Strahler'], 2], .5,
                        .3
                    ]
                }
            },
            {   
                'id': 'waterbodies',
                'type': 'fill',
                'source': 'waterbody',
                'source-layer': 'waterbody',
                'minzoom': 3,
                'maxzoom': 9,
                'paint':{
                    'fill-color': 'rgb(181,193,200)'
                }
            },
            {
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
                    'line-color': 'rgb(246,246,245)',
                    'line-width': 1
                }
            },
            {
                'filter': ['all', ['==', '$type', 'Point'],
                    ['==', 'class', 'city'],
                    ['!=', 'name', 'Atlanta']
                ],
                'id': 'place_label_city',
                'layout': {
                    'text-field': '{name:latin}\n{name:nonlatin}',
                    'text-font': ['Noto Sans Regular'],
                    'text-max-width': 10,
                    'text-size': {
                        'stops': [
                            [3, 8],
                            [8, 14]
                        ]
                    }
                },
                'maxzoom': 16,
                'minzoom': 5,
                'paint': {
                    'text-color': 'rgb(138,139,138)',
                    'text-halo-blur': 0
                },
                'source': 'openmaptiles',
                'source-layer': 'place',
                'type': 'symbol'
            },
            {
                'filter': ['all', ['==', '$type', 'Point'],
                    ['==', 'class', 'city'],
                    ['==', 'name', 'Atlanta']
                ],
                'id': 'atlanta_label',
                'layout': {
                    'text-field': '{name:latin}\n{name:nonlatin}',
                    'text-font': ['Noto Sans Regular'],
                    "text-transform": "uppercase",
                    'text-max-width': 20,
                    'text-letter-spacing': 1,
                    'text-offset': [.9, -2.6],
                    'text-size': {
                        'stops': [
                            [3, 12],
                            [8, 25]
                        ]
                    }
                },
                'maxzoom': 16,
                'minzoom': 5,
                'paint': {
                    'text-color': 'rgb(138,139,138)',
                    'text-halo-blur': 0
                },
                'source': 'openmaptiles',
                'source-layer': 'place',
                'type': 'symbol'
            },
            {
                'id': 'stateNames',
                'source': 'stateNames',
                'type': 'symbol',
                'layout': {
                    'text-field': ['get', 'State'],
                    'text-font': ['Noto Sans Regular'],
                    'text-offset': [0, -.1],
                    "text-size": {
                        "stops": [[5, 8],[6, 12], [7, 13]]
                    },
                    'text-transform': 'uppercase',
                    'text-letter-spacing': .2,
                    "text-max-width": 20,
                    'text-rotate': [
                    'case',
                    ['==', ['get', 'State'], 'Utah'], -90,
                    ['==', ['get', 'State'], 'Kansas'], -90,
                    0
                    ]
                },
                'paint':{
                    'text-color': 'rgb(138,139,138)',
                    'text-halo-blur': 0
                }
            }
        ]
    }
}
