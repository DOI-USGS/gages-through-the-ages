<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>Gage Changes Over Time</h2>
    <AutoCompleteSearchBox
      :city-names="cityNames"
      @submit="moveMapToSubmittedLocation"
    />
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
    <p>
      The USGS updates the locations and density of gages based on the current needs in a particular
      area. The above map allows a localized comparison between points in time.
    </p>
  </div>
</template>
<script>
import beforeStyle from '../assets/styles/beforeStyles';
import afterStyle from '../assets/styles/afterStyles';
import oldGages from '../assets/data/site_map_merc_1967';
import newGages from '../assets/data/site_map_merc_2018';
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
            cityNames: this.getCityNames(),
            center: [-84.39, 33.75],
            zoom: 7.5
        }
    },
    mounted(){
        this.getLocationByIP();
    },
    methods: {
        getLocationByIP() {
            const self = this;
            // Attempt to get rough idea of user location by testing the IP address.
            // If that fails, use some default coordinates to start the map compare.
            fetch('https://extreme-ip-lookup.com/json/')
                    .then( res => res.json())
                    .then(response => {
                        self.center = [response.lon, response.lat];
                        self.createMaps();
                    })
                    .catch((data, status) => {
                        console.log('Could not retrieve location by IP; using default coordinates for map center');
                        self.createMaps();
                    });
        },
        moveMapToSubmittedLocation(cityName) {
            const self = this;
            const nameSplitCityFromState = cityName.split(', ');

            usCities.usCities.forEach(function(city) {
                if (nameSplitCityFromState[0] === city.city && nameSplitCityFromState[1] === city.state) {
                   self.$store.afterMap.jumpTo({center: [city.longitude, city.latitude]});
                   self.$store.afterMap.jumpTo({center: [city.longitude, city.latitude]});
                }
            });
        },
        getCityNames() {
          let cityNames = [];
          usCities.usCities.forEach(function(city) {
              cityNames.push(city.city + ', ' + city.state);
          });
          return cityNames;
        },
        createMaps() {
            let radius = 2;
            let color = '#000000';
            let beforeMap = new mapboxgl.Map({
                container: 'before',
                style: beforeStyle.style,
                center: this.center,
                zoom: this.zoom,
                interactive: false
            });
            let afterMap = new mapboxgl.Map({
                container: 'after',
                style: afterStyle.style,
                center: this.center,
                zoom: this.zoom,
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
            this.$store.beforeMap = beforeMap; // add map to vuex store
            this.$store.afterMap = afterMap; // add map to vuex store

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
