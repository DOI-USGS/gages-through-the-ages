<template>
  <div
    id="takeaway"
    class="section"
  >
    <h2>{{ text.title }}</h2>
    <div
      v-for="paragraph in text.paragraphSections"
      :key="paragraph.paragraphText"
    >
      <p><span v-html="paragraph.paragraphText1" /></p>
      <p><span v-html="paragraph.paragraphText2" /></p>
    </div>
  </div>
</template>
<script>
import takeAwayText from "../assets/takeAway/takeAwayText";
export default {
    'name': 'TakeAway',
    data() {
        return {
            text: takeAwayText.textContents
        }
    }
}
</script>
<style lang="scss" scoped>

</style>
