<template>
  <div id="coloradoInset">
    <img
      src="~@/images/inset/insetColoradoSmall.png"
      srcset="~@/images/inset/insetColoradoSmall.png 199w, ~@/images/inset/insetColoradoMedium.png 397w, ~@/images/inset/insetColoradoLarge.png 794w"
      alt="United States Lower 48 Highlighting Colorado"
    >
  </div>
</template>
<script>
export default {
    'name': 'ColoradoInset'
}
</script>
<style lang="scss" scoped>
    #coloradoInset{
        width: 24%;
        height: 16%;
        position: absolute;
        left: 10px;
        bottom: 10px;
        z-index: 90000;
        object-fit: 'contain'; 
        img{
            width: 100%;
            height: 100%;
        }
    }
</style>