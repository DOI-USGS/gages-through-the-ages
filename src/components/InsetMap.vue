<template>
  <div id="insetMap">
    <img src="../images/inset/inset.jpg">
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
        border: solid rgb(255,255,255);
        border-width: 1px 0 0 1px;
        width: 35%;
        height: 20%;
        position: absolute;
        right: 0;
        bottom: 0;
        z-index: 90000;
    }
</style>