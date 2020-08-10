<template>
  <div id="Visualization">
    <GagesBarChartAnimation />
    <AnnotatedTimeline v-if="checkIfBarChartIsRendered" />
    <RealTime v-if="checkIfBarChartIsRendered" />
    <MapImageSlider v-if="checkIfBarChartIsRendered" />
    <TakeAway v-if="checkIfBarChartIsRendered" />
    <Methods v-if="checkIfBarChartIsRendered" />
    <References v-if="checkIfBarChartIsRendered" />
  </div>
</template>
<script>
  export default {
      name: 'Visualization',
      components: {
          GagesBarChartAnimation: () => import( /* webpackPrefetch: true */ /*webpackChunkName: "SVG-Animation"*/ "../components/GagesBarChartAnimation"),
          AnnotatedTimeline: () => import(/*webpackChunkName: "annotated-barchart"*/ "../components/AnnotatedTimeline"),
          RealTime: () => import( /*webpackChunkName: "real-time"*/ "../components/RealTime"),
          MapImageSlider: () => import( /*webpackChunkName: "image-slider"*/ "../components/MapImageSlider"),
          TakeAway: () => import(/*webpackChunkName: "take-away"*/ "../components/TakeAway"),
          Methods: () => import(/*webpackChunkName: "methods"*/ "../components/Methods"),
          References: () => import(/*webpackChunkName: "references"*/ "../components/References")
      },
      computed: {
           checkIfBarChartIsRendered() {
               return this.$store.state.svgRenderedOnInitialLoad;
           }
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
</style>
