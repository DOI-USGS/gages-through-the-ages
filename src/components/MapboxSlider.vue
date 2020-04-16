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
    <div id="year-text">
      <p class="before-year">
        1967
      </p>
      <p class="after-year">
        2018
      </p>
    </div>
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
    <div id="style-adjustments">
      <button
        id="standard"
        class="active"
        @click="switchStyle('standard'), active($event)"
      >
        standard
      </button>
      <button
        id="toner"
        @click="switchStyle('toner'), active($event)"
      >
        toner
      </button>
      <button
        id="terrain"
        @click="switchStyle('terrain'), active($event)"
      >
        terrain
      </button>
      <button
        id="watercolor"
        @click="switchStyle('waterColor'), active($event)"
      >
        water color
      </button>
    </div>
    <div id="before-locations-adjustments">
      <div>
        <range-slider
          id="adjustment-before-radius"
          v-model="beforeRadius"
          class="slider"
          min="1"
          max="10"
          step="1"
        />
        <span>before radius {{ beforeRadius }}</span>
      </div>
      <div>
        <range-slider
          id="adjustment-before-color"
          v-model="beforeColor"
          class="slider"
          min="0"
          max="360"
          step="1"
        />
        <span>before color {{ beforeColor }}</span>
      </div>
      <div>
        <range-slider
          id="adjustment-before-stroke-width"
          v-model="beforeStrokeWidth"
          class="slider"
          min="1"
          max="10"
          step="1"
        />
        <span>before stroke width {{ beforeStrokeWidth }}</span>
      </div>
      <div>
        <range-slider
          id="adjustment-before-stroke-color"
          v-model="beforeStrokeColor"
          class="slider"
          min="0"
          max="360"
          step="1"
        />
        <span>before stroke color {{ beforeStrokeColor }}</span>
      </div>
    </div>
    <div id="after-locations-adjustments">
      <div>
        <range-slider
            id="adjustment-after-radius"
            v-model="afterRadius"
            class="slider"
            min="1"
            max="10"
            step="1"
        />
        <span>after radius {{ afterRadius }}</span>
      </div>
      <div>
        <range-slider
          id="adjustment-after-color"
          v-model="afterColor"
          class="slider"
          min="0"
          max="360"
          step="1"
        />
        <span>after color {{ afterColor }}</span>
      </div>
      <div>
        <range-slider
          id="adjustment-after-stroke-width"
          v-model="afterStrokeWidth"
          class="slider"
          min="1"
          max="10"
          step="1"
        />
        <span>after stroke width {{ afterStrokeWidth }}</span>
      </div>
      <div>
        <range-slider
          id="adjustment-after-stroke-color"
          v-model="afterStrokeColor"
          class="slider"
          min="0"
          max="360"
          step="1"
        />
        <span>after stroke color {{ afterStrokeColor }}</span>
      </div>
    </div>
    <p>
      The USGS updates the locations and density of gages based on the current needs in a particular
      area. The above map allows a localized comparison between points in time.
    </p>
    <p class="warning">
      Text on this page is in the pre-approval stage.
    </p>
  </div>
</template>
<script>
import oldGages from '../assets/data/site_map_merc_1967';
import newGages from '../assets/data/site_map_merc_2018';
import mapboxgl from 'mapbox-gl';
import MapboxCompare from 'mapbox-gl-compare';
import AutoCompleteSearchBox from "./AutoCompleteSearchBox";
import usCities from "../assets/data/usCities";

import toner from "../assets/styles/toner";
import terrain from "../assets/styles/terrain";
import standard from "../assets/styles/standard";
import waterColor from "../assets/styles/waterColor";

import RangeSlider from 'vue-range-slider'
import 'vue-range-slider/dist/vue-range-slider.css'

export default {
    name: 'MapboxSlider',
    components: {
        AutoCompleteSearchBox,
        RangeSlider
    },
    data() {
        return {
            cityNames: this.getCityNames(),
            center: [-84.39, 33.75],
            zoom: 7.5,
            beforeRadius: 4,
            beforeColor: 245,
            beforeStrokeWidth: 1,
            beforeStrokeColor: 245,
            afterRadius: 4,
            afterColor: 245,
            afterStrokeWidth: 1,
            afterStrokeColor: 245,
            currentStyle: 'standard'
        }
    },
    watch: {
        beforeRadius: function() {this.$store.beforeMap.setPaintProperty('oldGages', 'circle-radius', this.beforeRadius);},
        beforeColor: function() {this.$store.beforeMap.setPaintProperty('oldGages', 'circle-color', 'hsla(' + this.beforeColor + ', 100%, 25%, 1)');},
        beforeStrokeWidth: function() {this.$store.beforeMap.setPaintProperty('oldGages', 'circle-stroke-width', this.beforeStrokeWidth);},
        beforeStrokeColor: function() {this.$store.beforeMap.setPaintProperty('oldGages', 'circle-stroke-color', 'hsla(' + this.beforeStrokeColor + ', 100%, 25%, 1)');},
        afterRadius: function() {this.$store.afterMap.setPaintProperty('newGages', 'circle-radius', this.afterRadius);},
        afterColor: function() {this.$store.afterMap.setPaintProperty('newGages', 'circle-color', 'hsla(' + this.afterColor + ', 100%, 25%, 1)');},
        afterStrokeWidth: function() {this.$store.afterMap.setPaintProperty('newGages', 'circle-stroke-width', this.afterStrokeWidth);},
        afterStrokeColor: function() {this.$store.afterMap.setPaintProperty('newGages', 'circle-stroke-color', 'hsla(' + this.afterStrokeColor + ', 100%, 25%, 1)');},
    },
    mounted(){
        this.getLocationByIP();
    },
    methods: {
        switchStyle(style) {
            const self = this;
            if (this.currentStyle !== style) {
                switch(style) {
                    case 'standard':
                        self.$store.beforeMap.setStyle(standard.style);
                        self.$store.afterMap.setStyle(standard.style);
                        break;
                    case 'toner':
                        self.$store.beforeMap.setStyle(toner.style);
                        self.$store.afterMap.setStyle(toner.style);
                        break;
                    case 'waterColor':
                        self.$store.beforeMap.setStyle(waterColor.style);
                        self.$store.afterMap.setStyle(waterColor.style);
                        break;
                    case 'terrain':
                        self.$store.beforeMap.setStyle(terrain.style);
                        self.$store.afterMap.setStyle(terrain.style);
                        break;
                    default:
                        self.$store.beforeMap.setStyle(toner.style);
                        self.$store.afterMap.setStyle(toner.style);
                }
            }
            self.currentStyle = style;
            self.addMonitoringLocationLayer();
        },
        active(event){
          let buttons = document.querySelectorAll('#style-adjustments button');
          buttons.forEach(function(button){
            button.classList.remove('active');
          })
          event.currentTarget.classList.add('active');
        },
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
                   self.$store.beforeMap.jumpTo({center: [city.longitude, city.latitude]});
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
        addMonitoringLocationLayer() {
            const self = this;

            this.$store.beforeMap.addSource('oldGages', {
                type: 'geojson',
                data: oldGages.nationalGagesBeforeMap
            });

            this.$store.beforeMap.addLayer({
                'id': 'oldGages',
                'source': 'oldGages',
                'type': 'circle',
                'paint': {
                    'circle-radius': self.beforeRadius,
                    'circle-color': 'hsla(' + self.beforeColor + ', 100%, 25%, 1)',
                    'circle-stroke-width': self.beforeStrokeWidth,
                    'circle-stroke-color': 'hsla(' + self.beforeStrokeColor + ', 100%, 25%, 1)'
                },
                'filter': ['==', '$type', 'Point']
            });

            this.$store.afterMap.addSource('newGages', {
                type: 'geojson',
                data: newGages.nationalGagesAfterMap
            });

            this.$store.afterMap.addLayer({
                'id': 'newGages',
                'source': 'newGages',
                'type': 'circle',
                'paint': {
                    'circle-radius':        self.afterRadius,
                    'circle-color':         'hsla(' + self.afterColor + ', 100%, 25%, 1)',
                    'circle-stroke-width':  self.afterStrokeWidth,
                    'circle-stroke-color':  'hsla(' + self.afterStrokeColor + ', 100%, 25%, 1)'
                },
                'filter': ['==', '$type', 'Point']
            });
        },
        createMaps() {
            let radius = 2;
            let color = '#000000';
            let strokeWidth = 1;
            let strokeColor = '#734AE8';
            let beforeMap = new mapboxgl.Map({
                container: 'before',
                style: standard.style,
                center: this.center,
                zoom: this.zoom,
                interactive: false
            });
            let afterMap = new mapboxgl.Map({
                container: 'after',
                style: standard.style,
                center: this.center,
                zoom: this.zoom,
                interactive: false
            });

            beforeMap.on('load', function() {
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
                        'circle-color': color,
                        'circle-stroke-width': strokeWidth,
                        'circle-stroke-color': strokeColor
                    },
                    'filter': ['==', '$type', 'Point']
                });
            });

            afterMap.on('load', function() {
                afterMap.addSource('newGages', {
                    type: 'geojson',
                    data: newGages.nationalGagesAfterMap
                });
                afterMap.addLayer({
                    'id': 'newGages',
                    'source': 'newGages',
                    'type': 'circle',
                    'paint': {
                        'circle-radius': radius,
                        'circle-color': color,
                        'circle-stroke-width': strokeWidth,
                        'circle-stroke-color': strokeColor
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

.autocomplete{
  margin-top:10px;
}

.warning{
  color: red;
  font-weight: bold;
}
/* what follow is for the sliders and related toggles added to help style the map */
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

#style-adjustments {
  display: flex;

  button {
    flex: 1;
    height: 30px;
    background: #fff;
    outline: none;
    border: 1px solid rgb(190,190,190);
    cursor: pointer;
    &:hover{
      color: #fff;
      background:#003366;
    }
  }
  button.active{
    color: #fff;
    background:#003366;
  }
}

#before-locations-adjustments {
  display: flex;
  div {
    flex: 1;
  }
}
#after-locations-adjustments {
  display: flex;
  div {
    flex: 1;
  }
}
</style>
