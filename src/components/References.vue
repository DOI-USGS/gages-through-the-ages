<template>
  <div>
    <h2>{{ title }}</h2>
    <div
      v-for="reference in references"
      :key="reference.reference"
    >
      <p class="about-ref">
        {{ reference.reference }}
        <a
          :href="reference.href"
          target="_blank"
        >
          <span v-html="reference.href" />
        </a>
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
