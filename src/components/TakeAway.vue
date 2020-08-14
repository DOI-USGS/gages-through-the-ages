<template>
  <div
    id="takeaway"
    class="section"
  >
    <h2><span class="lowlight">{{ text.title }}</span></h2>
    <div
      v-for="paragraph in text.paragraphSections"
      :key="paragraph.paragraphText"
    >
      <p><span v-html="paragraph.paragraphText1" /></p>
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
