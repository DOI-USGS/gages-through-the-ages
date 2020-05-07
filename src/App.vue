<template>
  <div id="app">
    <HeaderUSWDSBanner />
    <HeaderUSGS />
    <WorkInProgressWarning />
    <router-view :is-internet-explorer="isInternetExplorer" />
    <FooterUSGS />
  </div>
</template>

<script>
    import HeaderUSWDSBanner from './components/HeaderUSWDSBanner'
    import HeaderUSGS from './components/HeaderUSGS'
    import WorkInProgressWarning from "./components/WorkInProgressWarning";
    import FooterUSGS from './components/FooterUSGS'

    export default {
        name: 'App',
        components: {
            HeaderUSWDSBanner,
            HeaderUSGS,
            WorkInProgressWarning,
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
    color: #2c3e50;
    width: 100%;
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
    font-family:sans-serif;
  }

  figure{
    margin-top: 10px;
  }

  #Visualization{
    width: 95vw;
    max-width: 1210px;
    padding: 10px 0 10px 0;
    margin: 0 auto;
  }

  .section{
    margin-bottom: 20px;
  }

  @media screen and (min-width:768px){
    #header h3{
      font-size:1.2em;
      margin:0 0 0 10px;
      padding:0;
    }
  }

  @media screen and (min-width:1024px){
   #Visualization{
      width:770px;
    }
  }

  @media screen and (min-width:1500px){
    #Visualization{
      width:810px;
    }
  }
</style>
