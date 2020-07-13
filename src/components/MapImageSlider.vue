<template>
    <div class="section">
        <h2>{{ atlantaText.title }}</h2>
        <div
            v-for="paragraph in atlantaText.paragraphSections"
            :key="paragraph.aboveSliderText"
        >
            <p><span v-html="paragraph.aboveSliderText" /></p>
        </div>
        <div id="georgiaSlider" class="sliderContainer">
            <div id="sliderOne" class="beer-slider" data-beer-label="2018">
                <img src="@/assets/images/slider/georgiaAfter.png" alt="USGS Gages in Atlanta Georgia in 2018">
                <div class="beer-reveal" data-beer-label="1967">
                    <img src="@/assets/images/slider/georgiaBefore.png" alt="USGS Gages in Atlanta Georgia in 1967">
                </div>
            </div>
            <GeorgiaInsetMap />
        </div>
        <caption class="mapcaption">
            <span v-html="atlantaText.caption" />
        </caption>
        <div
            v-for="paragraph in atlantaText.paragraphSections"
            :key="paragraph.belowSliderText"
        >
            <p><span v-html="paragraph.belowSliderText" /></p>
        </div>
        <h2 class="spacer">
            {{ coloradoText.title }}
        </h2>
        <div
            v-for="paragraph in coloradoText.paragraphSections"
            :key="paragraph.aboveSliderText"
        >
            <p><span v-html="paragraph.aboveSliderText" /></p>
        </div>
        <div id="coloradoSlider" class="sliderContainer">
            <div id="sliderTwo" class="beer-slider" data-beer-label="2018">
                <img src="@/assets/images/slider/coloradoAfter.png" alt="USGS Gages in Atlanta Georgia in 2018">
                <div class="beer-reveal" data-beer-label="1967">
                    <img src="@/assets/images/slider/coloradoBefore.png" alt="USGS Gages in Atlanta Georgia in 1967">
                </div>
            </div>
            <ColoradoInset />
        </div>
        <caption class="mapcaption">
            <span v-html="coloradoText.caption" />
        </caption>
        <div
            v-for="paragraph in coloradoText.paragraphSections"
            :key="paragraph.paragraphText"
        >
            <p><span v-html="paragraph.paragraphText" /></p>
        </div>
    </div>
</template>
<script>
import BeerSlider from "beerslider";
import GeorgiaInsetMap from './georgiaInsetMap';
import ColoradoInset from './coloradoInsetMap';
import atlantaSliderText from "../assets/mapboxSlider/atlantaSliderText";
import coloradoSliderText from "../assets/mapboxSlider/coloradoSliderText";
export default {
    'name': 'MapImageSlider',
    components:{
        GeorgiaInsetMap,
        ColoradoInset
    },
    data(){
        return{
            atlantaText: atlantaSliderText.textContents,
            coloradoText: coloradoSliderText.textContents
        }
    },
    mounted(){
        window.addEventListener('load', function(){
            new BeerSlider(document.getElementById('sliderOne'));
            new BeerSlider(document.getElementById('sliderTwo'));
        })
    }
}
</script>
<style lang="scss">
@import /* webpackPrefetch: true */ '~beerslider/dist/BeerSlider.css';
$polygon: '~@/assets/images/polygon.png';
.spacer{
  margin-top: 4vh;
}
.sliderContainer{
    position: relative;
}
.beer-slider[data-beer-label]:after,
.beer-reveal[data-beer-label]:after{
    background: none;
    color: rgb(138,139,138);
    font-size: 1.2em;
    font-weight: bold;
    top: 5px;
} 
.beer-slider[data-beer-label]:after{
    right: 5px;
}
.beer-reveal[data-beer-label]:after {
  left: 5px; 
}
.beer-handle{
    background:#3887be;
}
.beer-ready .beer-handle, .beer-ready .beer-reveal{
    border-right: 2px solid #3887be;
}
.beer-handle:before, .beer-handle:after{
    border-left: 2px solid #fff;
    border-top: 2px solid #fff;
}

.beer-range:focus ~ .beer-handle {
    background: #3887be
}
.scale{
    position: absolute;
    right: 10px;
    bottom: 10px;
    width: inherit;
    z-index: 12;
}
.legendDot{
    height: 12px;
    width: 12px;
    display: inline-block;
    border-radius: 50%;
}
.urbanGage{
    background: #f7bb2e;
}
.ruralGage{
    background: #b087bd;
}
.urbanPolygon{
    background-image: url($polygon);
    background-size: contain;
    background-repeat: no-repeat;
    vertical-align: middle;
    height: 20px;
    width: 20px;
    display: inline-block;
}
@media screen and (min-width: 600px){
    .beer-slider[data-beer-label]:after,
    .beer-reveal[data-beer-label]:after{
        font-size: 1.5em;
    }
}
</style>