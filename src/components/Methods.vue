<template>
  <div
    id="methods"
    class="section"
  >
    <h2><a id="methods-anchor" />Methods</h2>
    <div class="usa-accordion usa-accordion--bordered">
      <div
        v-for="method in methods.methods"
        :key="method.title"
      >
        <h3 class="usa-accordion__heading">
          <button
            class="usa-accordion__button"
            aria-expanded="false"
            :aria-controls="method.title"
            @click="trackMethodClick"
          >
            {{ method.title }}
          </button>
        </h3>
        <div
          :id="method.title"
          class="usa-accordion__content usa-prose gage-target"
        >
          <p><span v-html="method.method" /></p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
    import methods from '../assets/methods/methods';
    export default {
        'name': 'Methods',
        data(){
            return{
                methods: methods.methodContent
            }
        },
        mounted() {
            // This is a fix for the weird USWDS glitch that causes the Methods section accordion menus to be open on page load
            const targetAccordionDivs = document.querySelectorAll('div.gage-target');
            targetAccordionDivs.forEach((div) => {
                div.setAttribute('hidden', '""');
            });
        },
        methods: {
            runGoogleAnalytics(eventName, action, label) {
                this.$ga.set({ dimension2: Date.now() });
                this.$ga.event(eventName, action, label);
            },
            trackMethodClick(event) {
              const methodClicked = 'Method clicked: ' + event.target.innerHTML;
              this.runGoogleAnalytics('method interaction', 'click', methodClicked);
            }
        }
    }
</script>
<style lang="scss" scoped>
$chevronLeft: '~@/assets/images/chevron-left.png';
$chevronDown: '~@/assets/images/chevron-down.png';

// Import Colors
$stateFill: #e4e4e3;
$white: rgb(255,255,255);
$axis: rgb(100,100,100);
$lightGray:rgb(237,237,237);
$darkGray: rgb(51,51,51);
$brightBlue: rgb(9,98,178);
$usgsGreen: rgb(51,120,53);
$brightYellow: rgb(255,200,51);


  h2{
    margin-bottom: 10px;
  }
  button:not([disabled]):focus{
    outline: none;
  }
  .usa-accordion__button{
    background-image: url($chevronDown);
    background-size: 15px 10px;
    background-color: $brightBlue;
    color: white;
  }
  .usa-accordion__button[aria-expanded=false]{
    background-image: url($chevronLeft);
    background-size: 10px 15px;
    background-color: rgb(241, 240, 240);
    color: $brightBlue;
  }

#app h2.usa-accordion__heading {
  margin: 0;
}
</style>
