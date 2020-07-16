<template>
  <div id="references">
    <h2>{{ title }}</h2>
    <div
      v-for="reference in references"
      :key="reference.reference"
    >
      <p class="about-ref"><span v-html="reference.reference" /></p>
    </div>
  </div>
</template>
<script>
    import references from "../assets/references/references.js";

    export default {
        name: "References",
        data() {
            return {
                title: references.referenceSection.title,
                references: references.referenceSection.references
            };
        },
    }
</script>

<style scoped lang="scss">
  #references{
    margin-bottom: 4vh;
  }
</style>
