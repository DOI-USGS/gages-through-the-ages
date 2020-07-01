import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export const store = new Vuex.Store({
    state: {
        svgRenderedOnInitialLoad: false

    },
    mutations: {
        changeBooleanStateOnSVGMapRender (state) {
            state.svgRenderedOnInitialLoad = true
        }
    }
});
