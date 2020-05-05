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
            urbanAreaGA: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/misctilesets/urbanAreaGA/{z}/{x}/{y}.pbf'],
                'minzoom': 0, // setting this to equal the minzoom of main map, real tile extent is 2
                'maxzoom': 14  // setting this to equal the maxzoom of main map, real tile extent is 10
            },
            openmaptiles: {
                type: 'vector',
                'tiles': ['https://maptiles-prod-website.s3-us-west-2.amazonaws.com/openmaptiles/baselayers/{z}/{x}/{y}.pbf'],
                'minzoom': 2,
                'maxzoom': 6
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
        'sprite': 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/misc/pattern/pattern',
        'glyphs': 'https://orangemug.github.io/font-glyphs/glyphs/{fontstack}/{range}.pbf',
        'layers': [
            {
                'id': 'background',
                'paint': {
                    'background-color': '#f5f5f7'
                },
                'type': 'background'
            },
            {
                'id': 'Neighboring Countries',
                'type': 'fill',
                'source': 'basemap',
                'minzoom': 2,
                'maxzoom': 24,
                'source-layer': 'neighboringcountry',
                'layout': {
                    'visibility': 'visible'
                },
                'paint': {
                    'fill-color': 'hsl(47, 26%, 88%)'
                },

            },
            {
                'filter': ['all', ['==', 'NAME', 'Georgia']],
                'id': 'georgia',
                'type': 'fill',
                'source': 'basemap',
                'source-layer': 'states',
                'minzoom': 2,
                'maxzoom': 24,
                'layout': {
                    'visibility': 'visible'
                },
                'paint': {
                    'fill-color': '#f7f7f7'
                }
            },
            {
                'id': 'urbanArea',
                'type': 'fill',
                'source': 'urbanAreaGA',
                'source-layer': 'urban_areas_ga',
                'paint':{
                    'fill-color': '#c8c8c8'
                }
            },
            {
                'id': 'Least Detail',
                'layerDescription': 'contains stream orders 4-10',
                'type': 'line',
                'source': 'nhd_streams_grouped',
                'source-layer': 'least_detail',
                'minzoom': 0,
                'maxzoom': 24,
                'layout': {
                    'visibility': 'visible'
                },
                'paint': {
                    'line-color': 'rgb(148,171,189)'
                },
                'showButtonLayerToggle': false,
                'showButtonStreamToggle': true
            },
            {
                'filter': ['all', ['==', '$type', 'Polygon'],
                    ['!=', 'intermittent', 1],
                ],
                'id': 'water',
                'paint': {
                    'fill-color': 'rgb(148,171,189)'
                },
                'source': 'openmaptiles',
                'source-layer': 'water',
                'type': 'fill',
                'layout': {
                    'visibility': 'visible'
                },

            },
            {   
                'filter': ['all', ['!=', 'NAME', 'Georgia']],
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
                    'fill-color': '#cfcfcf'
                }
            },
            {
                'filter': ['all', ['!=', 'NAME', 'Georgia']],
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
                    'line-color': 'rgb(180,180,180)'
                }
            },
            {
                'filter': ['all', ['==', 'NAME', 'Georgia']],
                'id': 'georgiaOutline',
                'type': 'line',
                'source': 'basemap',
                'source-layer': 'states',
                'minzoom': 2,
                'maxzoom': 24,
                'layout': {
                    'visibility': 'visible'
                },
                'paint': {
                    'line-color': 'rgb(0,0,0)'
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
                    'text-color': 'hsl(0, 0%, 0%)',
                    'text-halo-blur': 0,
                    'text-halo-color': 'hsla(0, 0%, 100%, 0.75)',
                    'text-halo-width': 2
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
                    'text-color': 'hsl(0, 0%, 0%)',
                    'text-halo-blur': 0,
                    'text-halo-color': 'hsla(0, 0%, 100%, 0.75)',
                    'text-halo-width': 2
                },
                'source': 'openmaptiles',
                'source-layer': 'place',
                'type': 'symbol'
            }
        ]
    }
}
