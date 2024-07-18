<template>
  <div id="code-repository-link-container">
    <a
      :href=gitHubRepositoryLink
      target="_blank"
      aria-label="github link"
    >See the code behind this visualization
      <font-awesome-icon :icon="{ prefix: 'fab', iconName: 'github' }" />
    </a>
  </div>
</template>

<script setup>
  const gitHubRepositoryLink = import.meta.env.VITE_APP_GITHUB_REPOSITORY_LINK;
</script>

<style scoped lang="scss">

  #code-repository-link-container {
    display: flex;
    justify-content: flex-end;
    width: 100%;
    background-color: #B5B5B5;
    margin: 0 auto;
    padding: 4px 15px;
    a {
      color: #151515;
      font-size: 16pt;
      font-weight: 400;
      margin-left: 10px;
      text-decoration: none;
    }
  }

</style>
