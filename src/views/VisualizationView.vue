<template>
  <section id="Visualization">
    <GagesBarChartAnimation />
    <AnnotatedTimeline v-if="checkIfSvgIsRendered"/>
    <RealTime v-if="checkIfSvgIsRendered"/>
    <MapImageSlider v-if="checkIfSvgIsRendered"/>
    <TakeAway v-if="checkIfSvgIsRendered"/>
    <MethodsSection v-if="checkIfSvgIsRendered"/>
    <ReferencesSection v-if="checkIfSvgIsRendered"/>
  </section>
</template>

<script setup>
  import {computed} from 'vue';
  import { useSvgRenderStore } from '@/stores/SvgRenderStore';
  const svgRenderStore = useSvgRenderStore();

  import GagesBarChartAnimation from '@/components/GagesBarChartAnimation.vue';
  import AnnotatedTimeline from '@/components/AnnotatedTimeline.vue';
  import RealTime from '@/components/RealTime.vue';
  import MapImageSlider from '@/components/MapImageSlider.vue';
  import TakeAway from '@/components/TakeAway.vue';
  import MethodsSection from '@/components/MethodsSection.vue';
  import ReferencesSection from '@/components/ReferencesSection.vue';

  // ADD CHECK IF SVG IS RENDERED
  const checkIfSvgIsRendered = computed(() => {
    return svgRenderStore.svgRenderedOnInitialLoad
  })
</script>

<style lang="scss" scoped>
  .section{
    margin-bottom: 4vh;
  }
  #Visualization{
    width: 95vw;
    max-width: 1210px;
    padding: 10px 0 10px 0;
    margin: 0 auto;
  }
  @media screen and (min-width:1024px){
   #Visualization{
      width:770px;
    }
  }
  @media screen and (min-width: 1024px) and (max-height: 900px){
    #Visualization{
      width:700px;
    }
  }
  /*Windows unique browser size*/
  @media screen and (min-width: 1300px) and (max-height: 652px){
    #Visualization{
      width:570px;
      .usa-accordion__heading{
        font-size: 1.06rem;
      }
      h2{
        font-size: 1.15rem;
      }
      caption,p{
        font-size: 1rem;
      }
    }
  }
</style>