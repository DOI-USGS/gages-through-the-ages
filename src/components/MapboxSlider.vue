<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>Context Slider</h2>
    <div id="maps">
      <div id="comparison-container">
        <div
          id="before"
          class="map"
        />
        <div
          id="after"
          class="map"
        />
      </div>
    </div>
  </div>
</template>
<script>
import beforeStyle from '../assets/styles/beforeStyles';
import afterStyle from '../assets/styles/afterStyles';
import oldGages from '../assets/data/site_map_merc_1967';
import newGages from '../assets/data/site_map_merc_2018';
import mapboxgl from 'mapbox-gl';
import MapboxCompare from 'mapbox-gl-compare';
export default {
    name: 'MapboxSlider',
    mounted(){
        this.CreateMaps();
    },
    methods: {
        CreateMaps(){
          let zoom = 5;
          let lat = -82.9001;
          let lon = 32.1656;
          let radius = 2;
          let color = '#000000'
          console.log(oldGages.nationalGagesBeforeMap);
            let beforeMap = new mapboxgl.Map({
                container: 'before',
                style: beforeStyle.style,
                center: [lat, lon],
                zoom: zoom,
                interactive: false
            });
            let afterMap = new mapboxgl.Map({
                container: 'after',
                style: afterStyle.style,
                center: [lat, lon],
                zoom: zoom,
                interactive: false
            });

            beforeMap.on('load', function(){
              beforeMap.addSource('oldGages', {
                type: 'geojson',
                data: oldGages.nationalGagesBeforeMap
              });
              beforeMap.addLayer({
                'id': 'oldGages',
                'source': 'oldGages',
                'type': 'circle',
                'paint': {
                  'circle-radius': radius,
                  'circle-color': color
                },
                'filter': ['==', '$type', 'Point']
              });
            });

            afterMap.on('load', function(){
              afterMap.addSource('newGages',{
                type: 'geojson',
                data: newGages.nationalGagesAfterMap
              });
              afterMap.addLayer({
                'id': 'newGages',
                'source': 'newGages',
                'type': 'circle',
                'paint': {
                  'circle-radius': radius,
                  'circle-color': color
                },
                'filter': ['==', '$type', 'Point']
              });
            });

            
            

            let container = '#comparison-container';

            new MapboxCompare(beforeMap, afterMap, container);
        }
    }
}
</script>
<style scoped lang='scss'>
@import '~mapbox-gl/dist/mapbox-gl.css';
@import '~mapbox-gl-compare/dist/mapbox-gl-compare.css';
#maps{
    position: relative;
    height: 350px;
    overflow: hidden;
}
.map {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
}
</style>