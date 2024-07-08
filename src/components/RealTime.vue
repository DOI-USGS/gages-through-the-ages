<template>
  <div class="section">
    <h2><span class="lowlight">{{ realtime.title }}</span></h2>
    <p v-html="realtime.paragraphText" />
  </div>
</template>
<script setup>
  import realTimeText from "@/assets/text/RealTimeText.js";
  
  const realtime = realTimeText.textContents;
</script>

<style scoped lang="scss">
 
</style>