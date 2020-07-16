<template>
  <div class="section">
    <h2>{{ realtime.title }}</h2>
    <p>{{realtime.paragraphText1}}</p>
    <p>{{realtime.paragraphText2}}</p>
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