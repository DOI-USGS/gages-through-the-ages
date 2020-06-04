<template>
    <div id="coloradoInset">
        <img src="../images/inset/insetColorado.png">
    </div>
</template>
<script>
export default {
    'name': 'ColoradoInset'
}
</script>
<style lang="scss" scoped>
    #coloradoInset{
        width: 20%;
        height: 12%;
        position: absolute;
        left: 10px;
        bottom: 10px;
        z-index: 90000;
        object-fit: 'contain'; 
    }
</style>