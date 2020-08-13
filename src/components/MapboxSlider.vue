<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>{{ atlantaText.title }}</h2>
    <div
      v-for="paragraph in atlantaText.paragraphSections"
      :key="paragraph.aboveSliderText"
    >
      <p><span v-html="paragraph.aboveSliderText" /></p>
    </div>
    <div
      class="maps"
      @click="trackSliderClick('atlanta')"
    >
      <div id="georgia-comparison-container">
        <!-- <GeorgiaInsetMap /> -->
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
    <caption class="mapcaption">
      <span v-html="atlantaText.caption" />
    </caption>
    <div
      v-for="paragraph in atlantaText.paragraphSections"
      :key="paragraph.belowSliderText"
    >
      <p><span v-html="paragraph.belowSliderText" /></p>
    </div>
  </div>
</template>
<script>
import mapboxgl from 'mapbox-gl';
import MapboxCompare from 'mapbox-gl-compare';
import standard from "../assets/styles/standard";
import GeorgiaInsetMap from './georgiaInsetMap';
import atlantaSliderText from "../assets/mapboxSlider/atlantaSliderText";
export default {
    'name': 'MapboxSlider',
    'components':{
      GeorgiaInsetMap
    },
    data() {
        return {
            georgiaCenter: [-84.3880, 33.7490],
            coloradoCenter: [-105.7821, 39.5501],
            zoom: 6,
            interactive: false,
            atlantaText: atlantaSliderText.textContents
        }
    },
    mounted(){
      this.createMaps();
    },
    methods: {
        createMaps() {
            const slider_present_sites_inview = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/contextSlider/slider_present_sites_inview_2018.geojson';
            const slider_past_sites_inview = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/contextSlider/slider_past_sites_inview_1967.geojson';
            const urban1970Extent = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/urbanExtents/urban_areas_combined_1970/{z}/{x}/{y}.pbf';
            const urban2018Extent = 'https://maptiles-prod-website.s3-us-west-2.amazonaws.com/gagesthroughages/urbanExtents/urban_areas_combined_2018/{z}/{x}/{y}.pbf';
            let radius = 4;
            let urban = '#f7bb2e';
            let rural = '#b087bd';
            let beforeYear = '1967';
            let afterYear = '2018';
            let georgiaBounds = [
              [-85.626583,32.909064],
              [-82.835487,34.687393]
            ];
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
            //Makes sure the bounds are being honored, hopefully for IOS
            let windowWidth = window.innerWidth;
            window.addEventListener('resize', function(){
              if(window.innerWidth != windowWidth){
                georgiaAfterMap.fitBounds(georgiaBounds);
                georgiaBeforeMap.fitBounds(georgiaBounds);
                coloradoAfterMap.fitBounds(coloradoBounds);
                coloradoBeforeMap.fitBounds(coloradoBounds);
              }
            }, {passive: true});
            //Add Urban Extents
            this.AddUrbanExtent(georgiaBeforeMap, urban1970Extent, 'ga1970Extent', 'combined_urban_areas_1970');
            this.AddUrbanExtent(georgiaAfterMap, urban2018Extent, 'ga2018Extent', 'combined_urban_areas_2018');
            //Get maps canvases
            let georgiaBeforeMapCanvas = georgiaBeforeMap.getCanvasContainer();
            let georgiaAfterMapCanvas = georgiaAfterMap.getCanvasContainer();
            //Creates divs in the canvas area
            this.CreateYearDiv(beforeYear, "beforeYear", georgiaBeforeMapCanvas);
            this.CreateYearDiv(afterYear, "afterYear", georgiaAfterMapCanvas);
            //Add geojson layers
            this.AddGeoJSON(georgiaBeforeMap, slider_past_sites_inview, 'slider_past_sites_inview', radius, urban, rural);
            this.AddGeoJSON(georgiaAfterMap, slider_present_sites_inview, 'slider_present_sites_inview', radius, urban, rural);
            //Add Scales
            // this.addScales(georgiaAfterMap);
            // this.addScales(georgiaBeforeMap);
            let georgiaContainer = '#georgia-comparison-container';
            //Creates the mapbox compares
            new MapboxCompare(georgiaBeforeMap, georgiaAfterMap, georgiaContainer);
        },
        AddUrbanExtent(map, url, source, sourceLayer){
          let self = this;
          map.on('load', function(){
            let findSymbolId = self.GetMapLayers(map, 'id', 'streams');
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
          let type;
          map.on('load', function() {
              let findSymbolId = self.GetMapLayers(map, 'type', 'symbol');
              map.addSource(source, {
                  type: 'geojson',
                  data: data
              });
              map.addLayer({
                  'id': source,
                  'source': source,
                  'type': 'circle',
                  'paint': {
                      'circle-radius': {
                        'stops': [
                            [5, 2],
                            [6, radius]
                        ]
                      },
                      'circle-color': [
                        'case',
                          ['==', ['get', 'is_urban'], true], urban,
                          rural
                      ],
                      'circle-stroke-color': [
                        'case',
                        ['==',['get', 'is_urban'], true], 'rgb(170,170,170)',
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
        GetMapLayers(map, value, string){
          var layers = map.getStyle().layers;
          let symbolId;
          if(value === 'id'){
            for(let i = 0; i < layers.length; i++){
              if(layers[i].id === string){
                symbolId = layers[i].id;
                break;
              }
            }
          }else{
            for(let i = 0; i < layers.length; i++){
              if(layers[i].type === string){
                symbolId = layers[i].id;
                break;
              }
            }
          }
          return symbolId;
        },
        CreateYearDiv(year, divId, canvas){
          let div = document.createElement('div');
          div.className = 'yearDiv ' +  divId + '';
          div.innerHTML = year;
          div.draggable = false;
          div.style.pointerEvents = "none";
          div.style.userSelect = "none";
          div.style.webkitUserSelect = "none";
          canvas.appendChild(div);
        },
        addScales(map){
          var scale = new mapboxgl.ScaleControl({
            maxWidth: 80,
            unit: 'imperial'
          });
          map.addControl(scale, 'bottom-right');
        },
        runGoogleAnalytics(eventName, action, label) {
            this.$ga.set({ dimension2: Date.now() });
            this.$ga.event(eventName, action, label);
        },
        trackSliderClick(clickedTarget) {
            const sliderCLicked = 'slider clicked: ' + clickedTarget;
            this.runGoogleAnalytics('slider interaction', 'click', sliderCLicked)
        }
    }
}
</script>
<style scoped lang='scss'>

// Import Colors
$stateFill: #e4e4e3;
$white: rgb(255,255,255);
$axis: rgb(100,100,100);
$lightGray:rgb(237,237,237);
$darkGray: rgb(51,51,51);
$brightBlue: rgb(9,98,178);
$usgsGreen: rgb(51,120,53);
$brightYellow: rgb(255,200,51);

@import /* webpackPrefetch: true */ '~mapbox-gl/dist/mapbox-gl.css';
@import /* webpackPrefetch: true */ '~mapbox-gl-compare/dist/mapbox-gl-compare.css';
.spacer{
  margin-top: 4vh;
}
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
.mapcaption{
  margin: 0 auto;
  line-height: 1.4em;
  max-width: 660px;
}
</style>
<style lang='scss'>
$polygon: '~@/assets/images/polygon.png';
$ScaleColor: rgb(120,120,120);
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
  .afterYear{
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
  .mapboxgl-ctrl-scale{
    background: none;
    border: 2px solid $ScaleColor;
    border-top: $ScaleColor;
    color: $ScaleColor;
    -webkit-user-select: none; /* Safari, Chrome */
    -khtml-user-select: none; /* Konqueror */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* IE */
    user-select: none; /* CSS3 */
    pointer-events: none;
  }
  .legendDot{
    height: 12px;
    width: 12px;
    display: inline-block;
    border-radius: 50%;
  }
  .urbanGage{
    background: $brightBlue;
  }
  .ruralGage{
    background: $brightBlue;
  }
  .urbanPolygon{
    background-image: url($polygon);
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    height: 20px;
    width: 20px;
    display: inline-block;
  }
</style>