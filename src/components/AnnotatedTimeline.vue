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
    <NewTimeline />
  </div>
</template>

<script>
  import annotatedTimelineText from "../assets/annotatedTimeline/annotatedTimeline";
  import NewTimeline from "./NewTimeline.vue";

  export default {
      name: 'AnnotatedTimeline',
      components: {
        NewTimeline
      },
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
  #imageArea {
    margin-top: 10px;
    text-align: center;
    p {
      text-align: left;
    }
  }
  #mobileAnnotatedBarCharts {
    text-align: center;
  }
  .breathingRoom {
    margin: 4vh 0;
  }
  @media screen and (min-width: 600px) {
    #oldTimeyImage {
      width: 40%;
      float: left;
      margin: 15px 30px 0px 0;
      padding: 2%;
    }
  }
</style>
