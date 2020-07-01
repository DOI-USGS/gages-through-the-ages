<template>
  <div id="Visualization">
    <GagesBarChartAnimation />
    <MapboxSlider />
    <AnnotatedTimeline />
    <TakeAway />
    <DataSources />
    <Methods />
    <References />
  </div>
</template>
<script>
  // import GagesBarChartAnimation from "../components/GagesBarChartAnimation";
  // import MapboxSlider from "../components/MapboxSlider";
  // import AnnotatedTimeline from "../components/AnnotatedTimeline";
  import TakeAway from '../components/TakeAway';
  import DataSources from "../components/DataSources";
  import Methods from "../components/Methods";
  import References from '../components/References';
  export default {
      name: 'Visualization',
      components: {
          GagesBarChartAnimation: () => import( /* webpackPrefetch: true */ /*webpackChunkName: "SVG-Animation"*/ "../components/GagesBarChartAnimation"),
          MapboxSlider: () => import(/*webpackChunkName: "mapbox-slider"*/ "../components/MapboxSlider"),
          AnnotatedTimeline: () => import(/*webpackChunkName: "annotated-barchart"*/ "../components/AnnotatedTimeline"),
          TakeAway,
          DataSources,
          Methods,
          References
      }
  }
</script>
<style lang="scss" scoped>
  .section{
    margin-bottom: 4vh;
  }
  #Visualization{
    width: 95vw;
    max-width: 1210px;
    padding: 10px 0 10px 0;
    margin: 0 auto;
  }
  @media screen and (min-width:1024px){
   #Visualization{
      width:770px;
    }
  }
  @media screen and (min-width: 1024px) and (max-height: 900px){
    #Visualization{
      width:700px;
    }
  }
  /*Windows unique browser size*/
  @media screen and (min-width: 1300px) and (max-height: 652px){
    #Visualization{
      width:570px;
      .usa-accordion__heading{
        font-size: 1.06rem;
      }
      h2{
        font-size: 1.15rem;
      }
      caption,p{
        font-size: 1rem;
      }
    }
  }
  @media screen and (min-width:1500px){
    #Visualization{
      width:810px;
    }
  }
</style>
