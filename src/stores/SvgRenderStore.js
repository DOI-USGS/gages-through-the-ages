import { defineStore } from 'pinia'

export const useSvgRenderStore = defineStore('SvgRenderStore', {
    state: () => {
        return {
            svgRenderedOnInitialLoad: false,
        }
    }
})
