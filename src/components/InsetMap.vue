<template>
  <div id="insetMap" />
</template>
<script>
import mapboxgl from 'mapbox-gl';
import insetStyles from '../assets/styles/inset';
import atlanta from '../assets/data/atlanta';
export default {
    'name': 'InsetMap',
    'mounted'(){
        this.CreateInsetMap();
    },
    'methods':{
        CreateInsetMap(){
            let bounds = [
                [-89.117403,24.892042], 
                [-74.232473,36.725470]
            ]
            let insetMap = new mapboxgl.Map({
                container: 'insetMap',
                style: insetStyles.style,
                center: [-82.9001, 32.1656],
                zoom: 3.5,
                interactive: true
            });
            insetMap.on('load', function(){
                insetMap.addSource('Atlanta', {
                  type: 'geojson',
                  data: atlanta.atlanta
                });
                insetMap.addLayer({
                    'id': 'Atlanta',
                    'source': 'Atlanta',
                    'type': 'fill',
                    'paint': {
                        'fill-color': 'rgba(20,20,20,.4)'
                    }
                });
            });
        }
    }
}
</script>
<style scoped lang="scss">
    #insetMap{
        border: solid rgb(50,50,50);
        border-width: 1px 0 0 1px;
        width: 35%;
        height: 20%;
        position: absolute;
        right: 0;
        bottom: 0;
        z-index: 90000;
    }
</style>