<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>Gage Changes Over Time</h2>
    <div class="maps">
      <div id="georgia-comparison-container">
        <InsetMap />
        <div
          id="georgiaBefore"
          class="map"
        />
        <div
          id="georgiaAfter"
          class="map"
        />
      </div>
    </div>
    <p>
      Factors that influence why USGS measures water resources have changed through time 
      [Gages are built at specific locations for many reasons.]​
    </p>
    <p>
      In present day, numerous gages are positioned near urban areas; these gages support 
      [flood prediction](NOAA link) and advanced evacuation warnings​
    </p>
    <p>
      The number of urban gages has increased​
    </p>
    <p>
      X% of all active USGS gages were located within [urban areas](link to definition) in 2018 while a 
      conservative estimate* suggests only Y% of gages would’ve been considered urban in 1967. ​
    </p>
    <p>
      Other needs that drove stream gaging in the past have become less important and many gages have been retired​.
    </p>
    <p>
      The need to estimate potential for hydropower in the Western US was met by establishing new gages in the 1900s 
      that would provide a full view of the seasonal water availability. As the creation of new dams slowed significantly, 
      the operation of some hydropower-oriented gages was no longer essential. ​
    </p>
    <div class="maps">
      <div id="colorado-comparison-container">
        <div
          id="coloradoBefore"
          class="map"
        />
        <div
          id="coloradoAfter"
          class="map"
        />
      </div>
    </div>
    <p class="warning">
      Text on this page is in the pre-approval stage and subject to change.
    </p>
  </div>
</template>
<script>
import oldGages from '../assets/data/site_map_merc_1967';
import newGages from '../assets/data/site_map_merc_2018';
import mapboxgl from 'mapbox-gl';
import MapboxCompare from 'mapbox-gl-compare';
import standard from "../assets/styles/standard";
import InsetMap from './InsetMap';

export default {
    'name': 'MapboxSlider',
    'components':{
      InsetMap
    },
    data() {
        return {
            georgiaCenter: [-84.3880, 33.7490],
            coloradoCenter: [-105.7821, 39.5501],
            zoom: 6,
            interactive: true
        }
    },
    mounted(){
        this.createMaps();
    },
    methods: {
        createMaps() {
            let radius = 4;
            let urban = '#f7bb2e';
            let rural = '#b087bd';
            let beforeYear = '1967';
            let afterYear = '2018';
            let bounds = [
              [-85.626583,32.909064],
              [-82.835487,34.687393]
            ]
            let georgiaBeforeMap = new mapboxgl.Map({
                container: 'georgiaBefore',
                style: standard.style,
                center: this.georgiaCenter,
                maxBounds: bounds,
                zoom: this.zoom,
                maxZoom: 9,
                interactive: this.interactive
            });
            let georgiaAfterMap = new mapboxgl.Map({
                container: 'georgiaAfter',
                style: standard.style,
                center: this.georgiaCenter,
                maxBounds: bounds,
                zoom: this.zoom,
                maxZoom: 9,
                interactive: this.interactive
            });
            let coloradoBeforeMap = new mapboxgl.Map({
                container: 'coloradoBefore',
                style: standard.style,
                center: this.coloradoCenter,
                zoom: this.zoom,
                maxZoom: 9,
                interactive: this.interactive
            });
            let coloradoAfterMap = new mapboxgl.Map({
                container: 'coloradoAfter',
                style: standard.style,
                center: this.coloradoCenter,
                zoom: this.zoom,
                maxZoom: 9,
                interactive: this.interactive
            });
            //Get maps canvases
            let georgiaBeforeMapCanvas = georgiaBeforeMap.getCanvasContainer();
            let georgiaAfterMapCanvas = georgiaAfterMap.getCanvasContainer();
            let coloradoBeforeMapCanvas = coloradoBeforeMap.getCanvasContainer();
            let coloradoAfterMapCanvas = coloradoAfterMap.getCanvasContainer();
            //Creates dives in the canvas area
            this.CreateYearDiv(beforeYear, "beforeYear", georgiaBeforeMapCanvas);
            this.CreateYearDiv(afterYear, "afterYear", georgiaAfterMapCanvas);
            this.CreateYearDiv(beforeYear, "beforeYear", coloradoBeforeMapCanvas);
            this.CreateYearDiv(afterYear, "afterYear", coloradoAfterMapCanvas);
            //Add geojson layers
            this.AddGeoJSON(georgiaBeforeMap, oldGages.nationalGagesBeforeMap, 'oldGages', radius, urban, rural);
            this.AddGeoJSON(georgiaAfterMap, newGages.nationalGagesAfterMap, 'newGages', radius, urban, rural);
            this.AddGeoJSON(coloradoBeforeMap, oldGages.nationalGagesBeforeMap, 'oldGages', radius, urban, rural);
            this.AddGeoJSON(coloradoAfterMap, newGages.nationalGagesAfterMap, 'newGages', radius, urban, rural);

            let georgiaContainer = '#georgia-comparison-container';
            let coloradoContainer = '#colorado-comparison-container';

            new MapboxCompare(georgiaBeforeMap, georgiaAfterMap, georgiaContainer);
            new MapboxCompare(coloradoBeforeMap, coloradoAfterMap, coloradoContainer);
        },
        AddGeoJSON(map, data, source, radius, urban, rural){
          map.on('load', function() {
              var layers = map.getStyle().layers;
              let symbolId;
              for(let i = 0; i < layers.length; i++){
                if(layers[i].type === 'symbol'){
                    symbolId = layers[i].id;
                    break;
                  }
                }
              map.addSource(source, {
                  type: 'geojson',
                  data: data
              });
              map.addLayer({
                  'id': source,
                  'source': source,
                  'type': 'circle',
                  'paint': {
                      'circle-radius': radius,
                      'circle-color': [
                        'case',
                        ['==', ['get', 'is_georgia_urban'], true], urban,
                        ['==', ['get', 'is_colorado_urban'], true], urban,
                        ['==', ['get', 'is_georgia'], true], rural,
                        ['==', ['get', 'is_colorado'], true], rural,
                        rural
                      ],
                      'circle-stroke-color': [
                        'case',
                        ['==',['get', 'is_georgia_urban'], true], 'rgb(170,170,170)',
                        ['==',['get', 'is_colorado_urban'], true], 'rgb(170,170,170)',
                        'rgb(240,240,240)'
                      ],
                      'circle-stroke-width': .2
                  },
                  'filter': ['==', '$type', 'Point']
              },
              symbolId
              );
          });
        },
        CreateYearDiv(year, divId, canvas){
          let div = document.createElement('div');
          div.setAttribute('id', divId);
          div.setAttribute('class', 'yearDiv');
          div.innerHTML = year;
          canvas.appendChild(div);
        }
    }
}
</script>
<style scoped lang='scss'>
@import '~mapbox-gl/dist/mapbox-gl.css';
@import '~mapbox-gl-compare/dist/mapbox-gl-compare.css';

.maps{
    position: relative;
    overflow: hidden;
    margin-top: 10px;
    &:after{
      content: "";
      display: block;
      padding-bottom: 100%;
    }
}
.map {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
}

.autocomplete{
  margin-top:10px;
}

.warning{
  color: red;
  font-weight: bold;
}

#year-text {
  display: flex;
  align-items: center;
  .before-year {
    flex: 1;
    text-align: center;
  }
  .after-year {
    flex: 1;
    text-align: center;
  }
}
</style>
<style lang='scss'>
  .yearDiv{
    position: relative;
    z-index: 9000;
    color: rgb(138,139,138);
    font-size: 2em;
    font-weight: bold;
    width: 60px;
    margin: 10px 0 0 10px;
    padding: 5px 0;
    text-align: center;
    &::selection{
      color: none;
      background: none;
    }
  }
  #afterYear{
    position: absolute;
    right: 10px;
  }
</style>
