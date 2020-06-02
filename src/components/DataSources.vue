<template>
  <div
    id="dataSources"
    class="section"
  >
    <h2>{{ text.title }}</h2>
    <div
      v-for="paragraph in text.paragraphSections"
      :key="paragraph.paragraphText"
    >
      <p><span v-html="paragraph.paragraphText" /></p>
    </div>
  </div>
</template>
<script>
import dataSourcesText from "../assets/dataSources/dataSourcesText";
export default {
    name: 'DataSources',
    data() {
        return {
            text: dataSourcesText.textContents
        }
    }
}
</script>
<style scoped lang="scss">

</style>
