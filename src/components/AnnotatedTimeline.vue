<template>
  <div
    id="annotated-bar-chart"
    class="section"
  >
    <h2>{{ text.title }}</h2>
    <div
      v-if="smallScreen"
      id="mobileAnnotatedBarCharts"
      class="breathingRoom"
    >
      <picture>
        <source
          srcset="@/assets/images/annotatedBarChart/barChartMobile.webp"
          type="image/webp"
        >
        <img
          src="@/assets/images/annotatedBarChart/barChartMobile.png"
          alt="annotated timeline showing the years 1900 to 1930."
        >
      </picture>
    </div>
    <div
      v-if="largeScreen"
      id="annotatedBarChart"
      class="breathingRoom"
    >
      <picture>
        <source
          srcset="@/assets/images/annotatedBarChart/barChart.webp"
          type="image/webp"
        >
        <img
          src="@/assets/images/annotatedBarChart/barChart.png"
          alt="annotated timeline showing important periods in gage history"
        >
      </picture>
    </div>
    <div
      v-for="paragraph in text.paragraphSections"
      :key="paragraph.paragraphText"
    >
      <p><span v-html="paragraph.paragraphText" /></p>
    </div>
  </div>
</template>

<script>
  import annotatedTimelineText from "../assets/annotatedTimeline/annotatedTimeline";

  export default {
      name: 'AnnotatedTimeline',
      data() {
          return {
              smallScreen: false,
              largeScreen: false,
              text: annotatedTimelineText.textContents
          }
      },
      mounted(){
        let self = this;
        window.addEventListener('load', function(){
          let windowSize = window.innerWidth;
          self.checkWindowSize(windowSize);
        }, {passive: true})
        window.addEventListener('resize', function(){
          let windowSize = window.innerWidth;
          self.checkWindowSize(windowSize);
        }, {passive: true});  
      },
      methods:{
        checkWindowSize(windowSize){
          if(windowSize <= 650){
            this.smallScreen = true;
            this.largeScreen = false;
          }else{
            this.smallScreen = false;
            this.largeScreen = true;
          }
        }
      }
  }
</script>

<style scoped lang="scss">
  #mobileAnnotatedBarCharts{
    text-align: center;
  }
  .breathingRoom{
    margin: 4vh 0;
  }
</style>
