<template>
  <div id="insetMap">
    <img
      src="~@/images/inset/insetGeorgiaSmall.png"
      srcset="~@/images/inset/insetGeorgiaSmall.png 200w, ~@/images/inset/insetGeorgiaMedium.png 402w, ~@/images/inset/insetGeorgiaLarge.png 804w"
      alt="The state of Georgia Highlighting the City of Atlanta"
    >
  </div>
</template>
<script>
export default {
    'name': 'InsetMap'
}
</script>
<style scoped lang="scss">
    #insetMap{
        width: 20%;
        height: 20%;
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