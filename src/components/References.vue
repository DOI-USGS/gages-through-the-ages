<template>
  <div
    id="references"
    class="section"
  >
    <h2><span class="lowlight">{{ title }}</span></h2>
    <div
      v-for="reference in references"
      :key="reference.reference"
    >
      <p class="about-ref">
        <span v-html="reference.reference" />
      </p>
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
  
</style>
