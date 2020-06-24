<template>
  <div class="pre-footer-links">
    <div class="inner-pre-footer-links-container">
      <p>Other visualizations of interest</p>
      <div class="footer-viz-links">
        <a :href="mariaLink">
          <figcaption>Hurricane Maria's Water Footprint</figcaption>
          <img src="@/assets/images/thumbnailMaria.png">
        </a>
        <a :href="waterUseLink">
          <figcaption>Water use in the U.S., 2015</figcaption>
          <img src="@/assets/images/thumbnailWaterUse.png">
        </a>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: 'WaterStorage',
        data() {
            return {
                mariaLink: process.env.VUE_APP_FOOTER_LINK_MARIA,
                waterUseLink: process.env.VUE_APP_FOOTER_LINK_WATER_USE
            };
        }
    }
</script>

<style scoped lang="scss">
/* for mobile */
#app {
  .pre-footer-links {
    display: flex;
    justify-content: center;
    text-align: center;
    font-family: 'Source Sans Pro',sans-serif;
    font-size: 12px;
    font-weight: 600;
    p {
      color: white;
    }

    background-color: #00264c;
    border-bottom: 1px solid white;
    .footer-viz-links {
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      justify-content: center;
      a {
        figcaption {
          color: white;
          text-align: center;
          padding-bottom: 0.5em;
        }
        padding: 0.5em;
        max-width: 20rem;
      }
    }
  }
}

/* for everything but mobile */
@media only screen and (min-width: 700px) {
  #app {
    .pre-footer-links {
      .footer-viz-links {
        flex-direction: row;
        justify-content: center;

        a {
        }
      }
    }
  }
}
</style>
