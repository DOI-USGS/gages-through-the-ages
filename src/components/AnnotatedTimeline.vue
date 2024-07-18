<template>
  <div
    id="annotated-bar-chart"
    class="section"
  >
    <h2><span class="lowlight">{{ text.title }}</span></h2>
    <div id="imageArea">
      <div id="oldTimeyImage-container">
        <picture>
          <source
            srcset="@/assets/images/oldTimey/Picture1.webp"
            type="image/webp"
          >
          <img
            id="oldTimeyImage"
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

<script setup>
  import annotatedTimelineText from "../assets/text/annotatedTimeline";
  import NewTimeline from "@/components/NewTimeline.vue";
  
  const text = annotatedTimelineText.textContents;
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
    #oldTimeyImage-container {
      width: 40%;
      float: left;
      margin: 15px 30px 0px 0;
      padding: 2%;
    }
  }
  #oldTimeyImage {
    width: 100%;
  }
</style>
