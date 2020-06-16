<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>{{ atlantaText.title }}</h2>
    <div class="maps">
      <div id="georgia-comparison-container">
        <GeorgiaInsetMap />
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
    <div
      v-for="paragraph in atlantaText.paragraphSections"
      :key="paragraph.paragraphText"
    >
      <p><span v-html="paragraph.paragraphText" /></p>
    </div>
    <div class="maps">
      <div id="colorado-comparison-container">
        <ColoradoInset />
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
    <div
    v-for="paragraph in coloradoText.paragraphSections"
    :key="paragraph.paragraphText"
  >
    <p><span v-html="paragraph.paragraphText" /></p>
  </div>
  </div>
</template>
<script>
import mapboxgl from 'mapbox-gl';
import MapboxCompare from 'mapbox-gl-compare';
import standard from "../assets/styles/standard";
import GeorgiaInsetMap from './georgiaInsetMap';
import ColoradoInset from './coloradoInsetMap';
import atlantaSliderText from "../assets/mapboxSlider/atlantaSliderText";
import coloradoSliderText from "../assets/mapboxSlider/coloradoSliderText";

export default {
    'name': 'MapboxSlider',
    'components':{
      GeorgiaInsetMap,
      ColoradoInset
    },
    data() {
        return {
            georgiaCenter: [-84.3880, 33.7490],
            coloradoCenter: [-105.7821, 39.5501],
            zoom: 6,
            interactive: false,
            atlantaText: atlantaSliderText.textContents,
            coloradoText: coloradoSliderText.textContents
        }
    },
    mounted(){
        this.createMaps();
    },
    methods: {
        createMaps() {
            const slider_present_sites_inview = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/contextSlider/site_map_w_attr_2018.json';
            const slider_past_sites_inview = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/contextSlider/site_map_w_attr_1967.json';
            const co1970Extent = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/urbanExtents/urban_areas_co_1970/{z}/{x}/{y}.pbf';
            const co2018Extent = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/urbanExtents/urban_areas_co_2018/{z}/{x}/{y}.pbf';
            const ga1970Extent = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/urbanExtents/urban_areas_ga_1970/{z}/{x}/{y}.pbf';
            const ga2018Extent = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/urbanExtents/urban_areas_ga_2018/{z}/{x}/{y}.pbf';
            let radius = 4;
            let urban = '#f7bb2e';
            let rural = '#b087bd';
            let beforeYear = '1967';
            let afterYear = '2018';
            let georgiaBounds = [
              [-85.626583,32.909064],
              [-82.835487,34.687393]
            ];
            let coloradoBounds = [
              [-110.074811,36.125882],
              [-101.035681,41.899945]
            ]
            let georgiaBeforeMap = new mapboxgl.Map({
                container: 'georgiaBefore',
                style: standard.style,
                center: this.georgiaCenter,
                maxBounds: georgiaBounds,
                zoom: this.zoom,
                maxZoom: 9,
                interactive: this.interactive
            });
            let georgiaAfterMap = new mapboxgl.Map({
                container: 'georgiaAfter',
                style: standard.style,
                center: this.georgiaCenter,
                maxBounds: georgiaBounds,
                zoom: this.zoom,
                maxZoom: 9,
                interactive: this.interactive
            });
            let coloradoBeforeMap = new mapboxgl.Map({
                container: 'coloradoBefore',
                style: standard.style,
                center: this.coloradoCenter,
                //zoom: this.zoom,
                maxBounds: coloradoBounds,
                maxZoom: 9,
                interactive: this.interactive
            });
            let coloradoAfterMap = new mapboxgl.Map({
                container: 'coloradoAfter',
                style: standard.style,
                center: this.coloradoCenter,
                //zoom: this.zoom,
                maxBounds: coloradoBounds,
                maxZoom: 9,
                interactive: this.interactive
            });
            //Add Urban Extents
            this.AddUrbanExtent(coloradoBeforeMap, co1970Extent, 'co1970Extent', 'urban_areas_co_1970');
            this.AddUrbanExtent(coloradoAfterMap, co2018Extent, 'co2018Extent', 'urban_areas_co_2018');
            this.AddUrbanExtent(georgiaBeforeMap, ga1970Extent, 'ga1970Extent', 'urban_areas_ga_1970');
            this.AddUrbanExtent(georgiaAfterMap, ga2018Extent, 'ga2018Extent', 'urban_areas_ga_2018');
            //Get maps canvases
            let georgiaBeforeMapCanvas = georgiaBeforeMap.getCanvasContainer();
            let georgiaAfterMapCanvas = georgiaAfterMap.getCanvasContainer();
            let coloradoBeforeMapCanvas = coloradoBeforeMap.getCanvasContainer();
            let coloradoAfterMapCanvas = coloradoAfterMap.getCanvasContainer();
            //Creates divs in the canvas area
            this.CreateYearDiv(beforeYear, "beforeYear", georgiaBeforeMapCanvas);
            this.CreateYearDiv(afterYear, "afterYear", georgiaAfterMapCanvas);
            this.CreateYearDiv(beforeYear, "beforeYear", coloradoBeforeMapCanvas);
            this.CreateYearDiv(afterYear, "afterYear", coloradoAfterMapCanvas);
            //Add geojson layers
            this.AddGeoJSON(georgiaBeforeMap, slider_past_sites_inview, 'slider_past_sites_inview', radius, urban, rural);
            this.AddGeoJSON(georgiaAfterMap, slider_present_sites_inview, 'slider_present_sites_inview', radius, urban, rural);
            this.AddGeoJSON(coloradoBeforeMap, slider_past_sites_inview, 'slider_past_sites_inview', radius, urban, rural);
            this.AddGeoJSON(coloradoAfterMap, slider_present_sites_inview, 'slider_present_sites_inview', radius, urban, rural);

            let georgiaContainer = '#georgia-comparison-container';
            let coloradoContainer = '#colorado-comparison-container';
            //Creates the mapbox compares
            new MapboxCompare(georgiaBeforeMap, georgiaAfterMap, georgiaContainer);
            new MapboxCompare(coloradoBeforeMap, coloradoAfterMap, coloradoContainer);
        },
        AddUrbanExtent(map, url, source, sourceLayer){
          let self = this;
          map.on('load', function(){
            let findSymbolId = self.GetMapLayers(map);
            map.addSource(source, {
              type: 'vector',
              tiles: [url]
            });
            map.addLayer({
              'id': source,
              'source': source,
              'source-layer': sourceLayer,
              'type': 'fill',
              'paint':{
                'fill-color': 'rgb(208,209,207)'
              }
            },
            findSymbolId)
          })
        },
        AddGeoJSON(map, data, source, radius, urban, rural){
          let self = this;
          map.on('load', function() {
              let findSymbolId = self.GetMapLayers(map);
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
              findSymbolId
              );
          });
        },
        GetMapLayers(map){
          var layers = map.getStyle().layers;
          let symbolId;
          for(let i = 0; i < layers.length; i++){
            if(layers[i].type === 'symbol'){
              symbolId = layers[i].id;
              break;
            }
          }
          return symbolId;
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
$polygon: '~@/assets/images/polygon.png';
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
  .mapboxgl-compare{
  width: 2px;
  background-color: #3887be;
  }
  .mapboxgl-compare .compare-swiper-vertical{
    box-shadow: inset 0 0 0 0 #fff
  }
  .legendDot{
    background: red;
    height: 12px;
    width: 12px;
    display: inline-block;
    border-radius: 50%;
  }
  #urbanGage{
    background: #f7bb2e;
  }
  #ruralGage{
    background: #b087bd;
  }
  #urbanPolygon{
    background-image: url($polygon);
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    height: 20px;
    width: 20px;
    display: inline-block;
  }
</style>
