<template>
  <div id="Visualization">
    <GagesBarChartAnimation />
    <MapboxSlider />
    <DataSources />
  </div>
</template>

<script>
  import GagesBarChartAnimation from "../components/GagesBarChartAnimation";
  import MapboxSlider from "../components/MapboxSlider";
  import DataSources from "../components/DataSources";
  export default {
      name: 'Visualization',
      components: {
          GagesBarChartAnimation,
          MapboxSlider,
          DataSources
      }
  }
</script>
