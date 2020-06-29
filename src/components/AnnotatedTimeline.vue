<template>
  <div
    id="annotated-bar-chart"
    class="section"
  >
    <h2>{{ text.title }}</h2>
    <img
      src="@/assets/images/barChart.jpg"
      alt="annotated timeline showing important periods in gage history"
    >
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
              text: annotatedTimelineText.textContents
          }
      }
  }

</script>

<style scoped lang="scss">
  img{
    margin: 4vh 0;
  }
</style>
