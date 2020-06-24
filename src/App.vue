<template>
  <div id="app">
    <HeaderUSWDSBanner />
    <HeaderUSGS />
    <WorkInProgressWarning />
    <router-view :is-internet-explorer="isInternetExplorer" />
    <FooterLinks />
    <FooterUSGS />
  </div>
</template>

<script>
    import HeaderUSWDSBanner from './components/HeaderUSWDSBanner'
    import HeaderUSGS from './components/HeaderUSGS'
    import WorkInProgressWarning from "./components/WorkInProgressWarning"
    import FooterLinks from './components/FooterLinks'
    import FooterUSGS from './components/FooterUSGS'


    export default {
        name: 'App',
        components: {
            HeaderUSWDSBanner,
            HeaderUSGS,
            WorkInProgressWarning,
            FooterLinks,
            FooterUSGS
        },
        data() {
            return {
                isInternetExplorer: false,
            }
        },
        created() {
            // We are ending support for Internet Explorer, so let's test to see if the browser used is IE.
            this.$browserDetect.isIE ? this.isInternetExplorer = true : this.isInternetExplorer = false;
        }
    }
</script>

<style lang="scss">
  body{
    margin: 0;
    padding: 0;
  }
  #app {
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    width: 100%;
    h1,h2{
      color: #003366;
    }
    caption,p{
      color: #2c3e50;
    }
  }
  caption{
    width: 100%;
    display: block;
    padding: 5px 0;
    font-style:italic;
  }
  .svg-text {
    -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none;   /* Chrome/Safari/Opera */
    -khtml-user-select: none;    /* Konqueror */
    -moz-user-select: none;      /* Firefox */
    -ms-user-select: none;       /* Internet Explorer/Edge */
    cursor: default;
  }
  *{
    padding:0; margin:0;
  }
  p{
    margin-top:10px;
    font-size:1.2em;
    line-height:1.5em;
  }

  a{
    text-decoration:none;
    cursor:pointer;
    color: #003366;
    font-weight: 600;
  }

  a:hover{
    text-decoration:underline;
  }

  body{
    font-family:Arial, Helvetica, sans-serif;
  }

  figure{
    margin-top: 10px;
  }
  @media screen and (min-width:768px){
    #header h3{
      font-size:1.2em;
      margin:0 0 0 10px;
      padding:0;
    }
  }

  /* aline the usa banner with usgs logo */
  .usa-banner__inner {
    margin-left: 10px;
    padding-left: 5px;
  }
</style>
