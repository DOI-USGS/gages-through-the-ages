<template>
  <div id="Visualization">
    <GagesBarChartAnimation />
    <MapboxSlider />
    <DataSources />
    <Embed />
  </div>
</template>

<script>
  import GagesBarChartAnimation from "../components/GagesBarChartAnimation";
  import MapboxSlider from "../components/MapboxSlider";
  import DataSources from "../components/DataSources";
  import Embed from "../components/Embed";

  export default {
      name: 'Visualization',
      components: {
          GagesBarChartAnimation,
          MapboxSlider,
          DataSources,
          Embed
      }
  }
</script>
