<template>
  <div id="insetMap">
    <img src="../images/inset/insetGeorgia.png">
  </div>
</template>
<script>
import mapboxgl from 'mapbox-gl';
import insetStyles from '../assets/styles/inset';
import atlantaInset from '../assets/data/atlantaInset';
export default {
    'name': 'InsetMap'
}
</script>
<style scoped lang="scss">
    #insetMap{
        width: 20%;
        height: 20%;
        position: absolute;
        left: 10px;
        bottom: 10px;
        z-index: 90000;
        object-fit: 'contain';
    }
</style>