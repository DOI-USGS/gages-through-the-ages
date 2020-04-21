<template>
  <div
    id="mapboxslider"
    class="section"
  >
    <h2>Gage Changes Over Time</h2>
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

export default {
    name: 'MapboxSlider',
    data() {
        return {
            center: [-84.39, 32.90],
            zoom: 5.5
        }
    },
    mounted(){
        this.createMaps();
    },
    methods: {
        createMaps() {
            let radius = 2;
            let color = '#000000';
            let strokeWidth = 1;
            let strokeColor = '#734AE8';
            let beforeYear = '1967';
            let afterYear = '2018';

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

            let beforeMapCanvas = beforeMap.getCanvasContainer();
            let afterMapCanvas = afterMap.getCanvasContainer();
            this.CreateYearDiv(beforeYear, "beforeYear", beforeMapCanvas);
            this.CreateYearDiv(afterYear, "afterYear", afterMapCanvas);

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

            new MapboxCompare(beforeMap, afterMap, container);
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

#maps{
    position: relative;
    height: 400px;
    overflow: hidden;
    margin-top: 10px;
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
    background: rgb(255,255,255);
    background: rgba(255,255,255,.9);
    border: 1px solid #2c5258;
    box-shadow: 1px 1px #909090;
    font-size: 1.8em;
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
