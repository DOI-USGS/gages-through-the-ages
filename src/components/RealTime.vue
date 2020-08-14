<template>
  <div class="section">
    <h2><span class="lowlight">{{ realtime.title }}</span></h2>
    <p v-html="realtime.paragraphText" />
  </div>
</template>
<script>
    import realTimeText from "../assets/RealTime/RealTimeText.js";

    export default {
        name: "RealTime",
        data() {
            return {
                realtime: realTimeText.textContents
            };
        },
    }
</script>

<style scoped lang="scss">
 
</style>