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
<script setup>
  import takeAwayText from "@/assets/text/takeAwayText";

  const text = takeAwayText.textContents
</script>
<style lang="scss" scoped>

</style>
