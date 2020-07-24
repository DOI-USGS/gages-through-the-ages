<template>
  <div
    id="annotated-bar-chart"
    class="section"
  >
    <h2>{{ text.title }}</h2>
    <div id="imageArea">
      <div id="oldTimeyImage">
        <picture>
          <source
            srcset="@/assets/images/oldTimey/Picture1.webp"
            type="image/webp"
          >
          <img
            src="@/assets/images/oldTimey/Picture1.png"
            alt="An early hydrographer makes measurements of Rio Grande river flow at Embudo, New Mexico."
          >
        </picture>
        <caption>An early hydrographer makes measurements of Rio Grande river flow at Embudo, New Mexico.</caption>
      </div>
      <div>
        <p v-html="text.firstParagraphText" />
      </div>
    </div>
    <div
      v-for="paragraph in text.paragraphSections"
      :key="paragraph.paragraphText"
    >
      <p><span v-html="paragraph.paragraphText" /></p>
    </div>
    <div
      v-if="smallScreen"
      id="mobileAnnotatedBarCharts"
      class="breathingRoom"
    >
      <picture>
        <source
          srcset="@/assets/images/annotatedBarChart/history_of_USGS_streamgage_network_mobile.webp"
          type="image/webp"
        >
        <img
          src="@/assets/images/annotatedBarChart/history_of_USGS_streamgage_network_mobile.png"
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
          srcset="@/assets/images/annotatedBarChart/history_of_USGS_streamgage_network.webp"
          type="image/webp"
        >
        <img
          src="@/assets/images/annotatedBarChart/history_of_USGS_streamgage_network.png"
          alt="annotated timeline showing important periods in gage history"
        >
      </picture>
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
  #imageArea{
    margin-top: 20px;
    display: block;
    text-align: center;
    p{
      text-align: left;
    }
  }
  #mobileAnnotatedBarCharts{
    text-align: center;
  }
  .breathingRoom{
    margin: 4vh 0;
  }
  @media screen and (min-width: 600px){
    #oldTimeyImage{
      width: 50%;
      float: left;
      margin: 5px 10px 10px 0;
    }
  }
  #oldTimeyImage {
    margin: 15px 30px 10px 0;
  }
</style>
