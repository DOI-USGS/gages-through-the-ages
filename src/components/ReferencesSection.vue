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

<script setup>
  import referenceSection from "@/assets/text/references";
  
  const title = referenceSection.referenceSection.title;
  const references = referenceSection.referenceSection.references;
</script>

<style scoped lang="scss">

</style>