<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>Context Slider</h2>
    <AutoCompleteSearchBox :city-names="cityNames" />
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
import mapboxgl from 'mapbox-gl';
import MapboxCompare from 'mapbox-gl-compare';
import AutoCompleteSearchBox from "./AutoCompleteSearchBox";
import usCities from "../assets/data/usCities";

export default {
    name: 'MapboxSlider',
    components: {
        AutoCompleteSearchBox
    },
    data() {
        return {
            cityNames: this.getCityNames()

        }
    },
    mounted(){
        this.createMaps();
    },
    methods: {
        getCityNames() {
          let cityNames = [];
          usCities.usCities.forEach(function(city) {
              cityNames.push(city.city + ', ' + city.state);
          });
          return cityNames;
        },
        createMaps(){
            let beforeMap = new mapboxgl.Map({
                container: 'before',
                style: beforeStyle.style,
                center: [-84.39, 33.75],
                zoom: 6,
                interactive: false
            });
            let afterMap = new mapboxgl.Map({
                container: 'after',
                style: afterStyle.style,
                center: [-84.39, 33.75],
                zoom: 6,
                interactive: false
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
