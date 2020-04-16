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
      <p class="before-year">1967</p>
      <p class="after-year">2018</p>
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
    <p>
      The USGS updates the locations and density of gages based on the current needs in a particular
      area. The above map allows a localized comparison between points in time.
    </p>
    <div id="style-adjustments">
      <button @click="switchStyle('standard')">
        standard
      </button>
      <button @click="switchStyle('toner')">
        toner
      </button>
      <button @click="switchStyle('terrain')">
        terrain
      </button>
      <button @click="switchStyle('waterColor')">
        water color
      </button>
    </div>
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

export default {
    name: 'MapboxSlider',
    components: {
        AutoCompleteSearchBox
    },
    data() {
        return {
            cityNames: this.getCityNames(),
            center: [-84.39, 33.75],
            zoom: 7.5,

            currentStyle: 'standard'

        }
    },
    mounted(){
        this.getLocationByIP();
    },
    methods: {
        switchStyle(style) {
            const self = this;
            if (this.currentStyle !== style) {
                console.log('switch to ', style)
                switch(style) {
                    case 'standard':
                        console.log('ran standard ')
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
            let radius = 4;
            let color = '#89D4CF';
            let strokeWidth = 1;
            let strokeColor = '#734AE8'

            this.$store.beforeMap.addSource('oldGages', {
                type: 'geojson',
                data: oldGages.nationalGagesBeforeMap
            });

            this.$store.beforeMap.addLayer({
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

            this.$store.afterMap.addSource('newGages', {
                type: 'geojson',
                data: newGages.nationalGagesAfterMap
            });

            this.$store.afterMap.addLayer({
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
  }
}
</style>
