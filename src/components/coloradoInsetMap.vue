<template>
  <div id="coloradoInset">
    <picture>
      <source srcset="@/assets/images/inset/insetColorado_large.webp" type="image/webp">
      <source srcset="@/assets/images/inset/insetColoradoLarge.png" type="image/png">
      <source srcset="@/assets/images/inset/insetColoradoMedium.png" type="image/png">
      <img 
        src="@/assets/images/inset/insetColoradoSmall.png" 
        alt="United States Lower 48 Highlighting Colorado"
        draggable="false"
        ondragstart="return false;"
      >
    </picture>
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
            -webkit-user-select: none; /* Safari, Chrome */
            -khtml-user-select: none; /* Konqueror */
            -moz-user-select: none; /* Firefox */
            -ms-user-select: none; /* IE */
            user-select: none; /* CSS3 */
        }
    }
</style>