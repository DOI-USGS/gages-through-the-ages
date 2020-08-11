<template>
  <div class="section">
    <h2>{{ atlantaText.title }}</h2>
    <div
      v-for="paragraph in atlantaText.paragraphSections"
      :key="paragraph.aboveMapText"
    >
      <p><span v-html="paragraph.aboveMapText" /></p>
    </div>
    <div
      id="cartoUSA" 
    >
      <svg
        id="cartogram-svg"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 -50 800 420"
        preserveAspectRatio="xMidYMid meet"
        version="1.1"
      >
    
        <g
          id="Maine-bars"
          transform="translate(459.585 0.76)"
        >
          <path
            id="Maine-counts"
            class="state-trend"
            d="M0,0 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-6 h1 v-1 h1 v-2 h1 v-2 h1 v2 h1 v-2 h1 v0 h1 v-3 h1 v-1 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v1 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v-1 h1 v-1 h1 v-3 h1 v-6 h1 v-2 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-2 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-5 h1 v0 h1 v0 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-1 h1 v-3 h1 v7 h1 v-3 h1 v-2 h1 v11 h1 v5 h1 v4 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v-1 h1 v0 h1 v3 h1 v1 h1 v1 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v-3 h1 v-8 h1 v-2 h1 v-3 h1 v1 h1 v-1 h1 v-1 h1 v0 h1 v5 h1 v-2 h1 v-6 h1 v-4 h1 v-1 h1 v0 h1 v2 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v61Z"
            transform="scale(0.317076923076923 0.6440625)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >ME</text>
        </g>
        <g
          id="Vermont-bars"
          transform="translate(415.815 44.53)"
        >
          <path
            id="Vermont-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v2 h1 v-2 h1 v-1 h1 v-1 h1 v-4 h1 v1 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v1 h1 v-2 h1 v5 h1 v1 h1 v0 h1 v0 h1 v1 h1 v-14 h1 v-3 h1 v-1 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-3 h1 v-6 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-11 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v2 h1 v9 h1 v1 h1 v-2 h1 v2 h1 v0 h1 v1 h1 v0 h1 v-4 h1 v6 h1 v2 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v4 h1 v-11 h1 v3 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v-2 h1 v2 h1 v0 h1 v0 h1 v-5 h1 v-6 h1 v10 h1 v-1 h1 v1 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v47Z"
            transform="scale(0.317076923076923 0.749454545454545)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >VT</text>
        </g>
        <g
          id="New Hampshire-bars"
          transform="translate(459.585 44.53)"
        >
          <path
            id="New Hampshire-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v1 h1 v0 h1 v-2 h1 v-3 h1 v-2 h1 v0 h1 v1 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v-4 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v-2 h1 v0 h1 v-2 h1 v-1 h1 v-7 h1 v-4 h1 v-1 h1 v-2 h1 v0 h1 v0 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v-5 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v4 h1 v0 h1 v-1 h1 v2 h1 v0 h1 v0 h1 v3 h1 v5 h1 v6 h1 v-1 h1 v4 h1 v0 h1 v-1 h1 v1 h1 v1 h1 v1 h1 v-2 h1 v0 h1 v-1 h1 v6 h1 v2 h1 v0 h1 v-1 h1 v-2 h1 v-3 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-7 h1 v-1 h1 v-4 h1 v12 h1 v-1 h1 v-2 h1 v4 h1 v-7 h1 v-8 h1 v4 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v-1 h1 v0 h1 v53Z"
            transform="scale(0.317076923076923 0.675737704918033)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NH</text>
        </g>
        <g
          id="Washington-bars"
          transform="translate(0 88.3)"
        >
          <path
            id="Washington-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v1 h1 v-1 h1 v3 h1 v-2 h1 v-5 h1 v-1 h1 v-1 h1 v3 h1 v-9 h1 v-10 h1 v-14 h1 v-16 h1 v-10 h1 v15 h1 v-16 h1 v4 h1 v18 h1 v-10 h1 v1 h1 v-3 h1 v-3 h1 v2 h1 v0 h1 v7 h1 v1 h1 v-5 h1 v0 h1 v5 h1 v-11 h1 v-22 h1 v-36 h1 v4 h1 v11 h1 v9 h1 v1 h1 v-6 h1 v-2 h1 v-3 h1 v-5 h1 v0 h1 v-10 h1 v0 h1 v-8 h1 v-6 h1 v-18 h1 v-20 h1 v-45 h1 v-27 h1 v-7 h1 v1 h1 v0 h1 v16 h1 v-6 h1 v-9 h1 v0 h1 v3 h1 v-5 h1 v-4 h1 v-8 h1 v-1 h1 v-6 h1 v-22 h1 v-10 h1 v-6 h1 v-19 h1 v-10 h1 v11 h1 v1 h1 v-8 h1 v14 h1 v16 h1 v20 h1 v34 h1 v13 h1 v13 h1 v-5 h1 v4 h1 v-10 h1 v13 h1 v13 h1 v14 h1 v1 h1 v14 h1 v-6 h1 v3 h1 v-15 h1 v1 h1 v12 h1 v-7 h1 v2 h1 v13 h1 v-8 h1 v-1 h1 v-6 h1 v-12 h1 v0 h1 v5 h1 v-10 h1 v-3 h1 v5 h1 v-3 h1 v-1 h1 v-9 h1 v-7 h1 v8 h1 v3 h1 v-4 h1 v-8 h1 v-2 h1 v-2 h1 v5 h1 v-6 h1 v-3 h1 v0 h1 v-1 h1 v-4 h1 v4 h1 v-2 h1 v-3 h1 v-6 h1 v250Z"
            transform="scale(0.317076923076923 0.121235294117647)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >WA</text>
        </g>
        <g
          id="Idaho-bars"
          transform="translate(43.77 88.3)"
        >
          <path
            id="Idaho-counts"
            class="state-trend"
            d="M0,0 v0 h1 v-2 h1 v1 h1 v0 h1 v1 h1 v0 h1 v-4 h1 v3 h1 v0 h1 v-3 h1 v3 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v-1 h1 v2 h1 v-3 h1 v-1 h1 v-9 h1 v-21 h1 v-20 h1 v3 h1 v-2 h1 v16 h1 v-1 h1 v10 h1 v-3 h1 v-3 h1 v-19 h1 v-10 h1 v-16 h1 v7 h1 v-1 h1 v-2 h1 v-5 h1 v-2 h1 v4 h1 v-16 h1 v-7 h1 v-7 h1 v-14 h1 v7 h1 v2 h1 v-2 h1 v-4 h1 v-4 h1 v-13 h1 v-3 h1 v-21 h1 v-5 h1 v6 h1 v-5 h1 v-1 h1 v-11 h1 v-5 h1 v-12 h1 v4 h1 v4 h1 v9 h1 v-5 h1 v-2 h1 v16 h1 v-3 h1 v-1 h1 v-12 h1 v3 h1 v-1 h1 v-5 h1 v9 h1 v1 h1 v-2 h1 v5 h1 v0 h1 v-4 h1 v-2 h1 v-4 h1 v-4 h1 v1 h1 v8 h1 v2 h1 v15 h1 v3 h1 v7 h1 v4 h1 v-2 h1 v-6 h1 v7 h1 v-2 h1 v-6 h1 v-1 h1 v9 h1 v13 h1 v-1 h1 v-8 h1 v-53 h1 v16 h1 v6 h1 v0 h1 v4 h1 v5 h1 v-5 h1 v3 h1 v1 h1 v5 h1 v0 h1 v3 h1 v4 h1 v-9 h1 v0 h1 v-5 h1 v-4 h1 v-5 h1 v2 h1 v-1 h1 v0 h1 v9 h1 v0 h1 v2 h1 v-2 h1 v-8 h1 v-13 h1 v5 h1 v4 h1 v-3 h1 v-6 h1 v1 h1 v-15 h1 v4 h1 v204Z"
            transform="scale(0.317076923076923 0.198173076923077)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >ID</text>
        </g>
        <g
          id="Montana-bars"
          transform="translate(87.54 88.3)"
        >
          <path
            id="Montana-counts"
            class="state-trend"
            d="M0,0 v-4 h1 v-1 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-1 h1 v-3 h1 v1 h1 v1 h1 v-5 h1 v-4 h1 v0 h1 v-1 h1 v-1 h1 v-14 h1 v-9 h1 v-16 h1 v-8 h1 v9 h1 v6 h1 v-6 h1 v12 h1 v-4 h1 v6 h1 v-3 h1 v-4 h1 v0 h1 v-4 h1 v-8 h1 v-7 h1 v11 h1 v13 h1 v2 h1 v2 h1 v4 h1 v-20 h1 v-8 h1 v-8 h1 v-4 h1 v28 h1 v5 h1 v-31 h1 v-14 h1 v1 h1 v1 h1 v-12 h1 v-15 h1 v1 h1 v-10 h1 v14 h1 v0 h1 v-1 h1 v-16 h1 v-25 h1 v-12 h1 v-10 h1 v2 h1 v-6 h1 v-23 h1 v4 h1 v59 h1 v1 h1 v-9 h1 v4 h1 v-7 h1 v-2 h1 v-8 h1 v-7 h1 v0 h1 v-3 h1 v6 h1 v-5 h1 v-3 h1 v5 h1 v5 h1 v-2 h1 v17 h1 v2 h1 v5 h1 v-8 h1 v0 h1 v-5 h1 v-8 h1 v2 h1 v-3 h1 v-8 h1 v-1 h1 v-1 h1 v0 h1 v-18 h1 v-6 h1 v4 h1 v21 h1 v8 h1 v7 h1 v0 h1 v0 h1 v1 h1 v0 h1 v15 h1 v0 h1 v-7 h1 v7 h1 v7 h1 v-4 h1 v0 h1 v-5 h1 v-8 h1 v-7 h1 v1 h1 v-5 h1 v8 h1 v-3 h1 v15 h1 v-8 h1 v-3 h1 v1 h1 v3 h1 v4 h1 v-12 h1 v3 h1 v-7 h1 v-4 h1 v4 h1 v3 h1 v-5 h1 v162Z"
            transform="scale(0.317076923076923 0.204059405940594)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MT</text>
        </g>
        <g
          id="North Dakota-bars"
          transform="translate(131.31 88.3)"
        >
          <path
            id="North Dakota-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-6 h1 v-2 h1 v1 h1 v2 h1 v-1 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-6 h1 v-3 h1 v-2 h1 v-2 h1 v3 h1 v2 h1 v-2 h1 v-1 h1 v-1 h1 v-6 h1 v-4 h1 v-3 h1 v-1 h1 v0 h1 v0 h1 v-8 h1 v-3 h1 v-9 h1 v-4 h1 v0 h1 v-2 h1 v-6 h1 v-4 h1 v0 h1 v-1 h1 v-1 h1 v-3 h1 v-3 h1 v-12 h1 v-7 h1 v0 h1 v-3 h1 v-1 h1 v-3 h1 v-1 h1 v2 h1 v-3 h1 v-6 h1 v-2 h1 v0 h1 v1 h1 v0 h1 v4 h1 v-2 h1 v2 h1 v-1 h1 v-3 h1 v5 h1 v-1 h1 v-18 h1 v-8 h1 v3 h1 v-1 h1 v27 h1 v21 h1 v4 h1 v3 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v3 h1 v-1 h1 v-4 h1 v-4 h1 v6 h1 v4 h1 v0 h1 v1 h1 v1 h1 v-1 h1 v-1 h1 v-4 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-3 h1 v-2 h1 v-2 h1 v1 h1 v-2 h1 v2 h1 v-1 h1 v4 h1 v1 h1 v-1 h1 v-2 h1 v80Z"
            transform="scale(0.317076923076923 0.312272727272727)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >ND</text>
        </g>
        <g
          id="Minnesota-bars"
          transform="translate(175.08 88.3)"
        >
          <path
            id="Minnesota-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-13 h1 v-2 h1 v-9 h1 v0 h1 v3 h1 v4 h1 v-4 h1 v2 h1 v19 h1 v-1 h1 v1 h1 v-3 h1 v1 h1 v-1 h1 v-3 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-12 h1 v-6 h1 v-9 h1 v-3 h1 v2 h1 v-3 h1 v-8 h1 v-5 h1 v1 h1 v1 h1 v1 h1 v-13 h1 v-6 h1 v-2 h1 v-11 h1 v0 h1 v-6 h1 v-4 h1 v-4 h1 v5 h1 v-2 h1 v-6 h1 v1 h1 v-2 h1 v-7 h1 v-7 h1 v4 h1 v5 h1 v3 h1 v0 h1 v3 h1 v-3 h1 v-3 h1 v7 h1 v9 h1 v-3 h1 v5 h1 v-6 h1 v-3 h1 v-8 h1 v-9 h1 v1 h1 v7 h1 v2 h1 v-5 h1 v-1 h1 v2 h1 v-7 h1 v-5 h1 v1 h1 v13 h1 v6 h1 v7 h1 v12 h1 v-7 h1 v5 h1 v3 h1 v-2 h1 v3 h1 v-2 h1 v-6 h1 v7 h1 v4 h1 v-5 h1 v-1 h1 v3 h1 v2 h1 v-5 h1 v-2 h1 v-1 h1 v2 h1 v1 h1 v2 h1 v-6 h1 v-6 h1 v1 h1 v-5 h1 v-1 h1 v1 h1 v-3 h1 v3 h1 v4 h1 v-1 h1 v-9 h1 v3 h1 v-3 h1 v-5 h1 v3 h1 v1 h1 v0 h1 v-2 h1 v106Z"
            transform="scale(0.317076923076923 0.340661157024793)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MN</text>
        </g>
        <g
          id="Wisconsin-bars"
          transform="translate(218.85 88.3)"
        >
          <path
            id="Wisconsin-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v2 h1 v-2 h1 v-1 h1 v-3 h1 v6 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v-7 h1 v-30 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v2 h1 v-1 h1 v3 h1 v1 h1 v0 h1 v-2 h1 v3 h1 v-1 h1 v1 h1 v-4 h1 v1 h1 v-3 h1 v0 h1 v-1 h1 v-1 h1 v-6 h1 v-2 h1 v-1 h1 v-1 h1 v-3 h1 v-8 h1 v0 h1 v-1 h1 v-7 h1 v0 h1 v-13 h1 v1 h1 v-3 h1 v1 h1 v-4 h1 v0 h1 v-2 h1 v3 h1 v-1 h1 v1 h1 v4 h1 v5 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-1 h1 v7 h1 v0 h1 v-8 h1 v-6 h1 v3 h1 v-3 h1 v0 h1 v-8 h1 v4 h1 v5 h1 v-7 h1 v-7 h1 v5 h1 v-1 h1 v-12 h1 v-16 h1 v5 h1 v-6 h1 v15 h1 v4 h1 v18 h1 v-2 h1 v1 h1 v-2 h1 v2 h1 v1 h1 v-4 h1 v-13 h1 v-4 h1 v6 h1 v-7 h1 v-1 h1 v-10 h1 v-1 h1 v16 h1 v-4 h1 v-4 h1 v-18 h1 v-6 h1 v7 h1 v-5 h1 v-9 h1 v-7 h1 v-16 h1 v-6 h1 v12 h1 v-4 h1 v5 h1 v-1 h1 v-11 h1 v-3 h1 v-10 h1 v4 h1 v-1 h1 v4 h1 v0 h1 v-8 h1 v0 h1 v198Z"
            transform="scale(0.317076923076923 0.208181818181818)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >WI</text>
        </g>
        <g
          id="Michigan-bars"
          transform="translate(284.505 88.3)"
        >
          <path
            id="Michigan-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v-1 h1 v0 h1 v1 h1 v2 h1 v1 h1 v0 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v3 h1 v-2 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-11 h1 v0 h1 v-5 h1 v1 h1 v-7 h1 v-3 h1 v2 h1 v-5 h1 v-12 h1 v-4 h1 v-1 h1 v7 h1 v-22 h1 v-1 h1 v-13 h1 v-9 h1 v-4 h1 v-7 h1 v-12 h1 v-1 h1 v-12 h1 v-10 h1 v-10 h1 v0 h1 v-8 h1 v-1 h1 v0 h1 v1 h1 v-7 h1 v-8 h1 v-5 h1 v-7 h1 v-6 h1 v2 h1 v-9 h1 v-10 h1 v-7 h1 v-3 h1 v3 h1 v-1 h1 v5 h1 v2 h1 v5 h1 v3 h1 v-4 h1 v3 h1 v0 h1 v8 h1 v3 h1 v-2 h1 v9 h1 v15 h1 v21 h1 v6 h1 v3 h1 v-1 h1 v1 h1 v-7 h1 v-4 h1 v2 h1 v-1 h1 v3 h1 v-1 h1 v7 h1 v-5 h1 v4 h1 v-2 h1 v0 h1 v-2 h1 v-2 h1 v-5 h1 v-10 h1 v-7 h1 v6 h1 v-10 h1 v8 h1 v4 h1 v2 h1 v0 h1 v2 h1 v1 h1 v11 h1 v-8 h1 v5 h1 v-14 h1 v-5 h1 v3 h1 v1 h1 v-2 h1 v162Z"
            transform="scale(0.317076923076923 0.191720930232558)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MI</text>
        </g>
        <g
          id="New York-bars"
          transform="translate(372.045 88.3)"
        >
          <path
            id="New York-counts"
            class="state-trend"
            d="M0,0 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-4 h1 v-1 h1 v-2 h1 v0 h1 v-4 h1 v3 h1 v-10 h1 v-1 h1 v2 h1 v0 h1 v-4 h1 v-4 h1 v0 h1 v-2 h1 v-6 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v-7 h1 v0 h1 v-1 h1 v-5 h1 v-14 h1 v-4 h1 v-4 h1 v-5 h1 v-5 h1 v-2 h1 v-7 h1 v-1 h1 v8 h1 v-6 h1 v-3 h1 v-2 h1 v-1 h1 v-28 h1 v-19 h1 v-3 h1 v-11 h1 v-1 h1 v-2 h1 v-3 h1 v-12 h1 v-5 h1 v-4 h1 v-2 h1 v-1 h1 v-4 h1 v-5 h1 v-4 h1 v-2 h1 v0 h1 v-2 h1 v-8 h1 v0 h1 v-8 h1 v-8 h1 v-6 h1 v-16 h1 v1 h1 v9 h1 v5 h1 v-16 h1 v-2 h1 v1 h1 v-7 h1 v71 h1 v4 h1 v4 h1 v-3 h1 v-3 h1 v0 h1 v-5 h1 v-1 h1 v4 h1 v1 h1 v-2 h1 v-3 h1 v-2 h1 v7 h1 v2 h1 v6 h1 v-2 h1 v0 h1 v1 h1 v3 h1 v2 h1 v8 h1 v-18 h1 v-13 h1 v-1 h1 v-8 h1 v14 h1 v5 h1 v-2 h1 v-17 h1 v-6 h1 v6 h1 v-8 h1 v-7 h1 v-3 h1 v-3 h1 v1 h1 v-8 h1 v-1 h1 v0 h1 v9 h1 v-6 h1 v7 h1 v-5 h1 v-3 h1 v6 h1 v-15 h1 v-10 h1 v-6 h1 v-16 h1 v-15 h1 v295Z"
            transform="scale(0.317076923076923 0.139728813559322)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NY</text>
        </g>
        <g
          id="Massachusetts-bars"
          transform="translate(415.815 88.3)"
        >
          <path
            id="Massachusetts-counts"
            class="state-trend"
            d="M0,0 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-3 h1 v-3 h1 v-1 h1 v-1 h1 v-5 h1 v2 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-3 h1 v-1 h1 v-8 h1 v-4 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-3 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v2 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v3 h1 v-3 h1 v-5 h1 v-5 h1 v-1 h1 v-2 h1 v-9 h1 v1 h1 v0 h1 v-1 h1 v-3 h1 v3 h1 v-4 h1 v0 h1 v6 h1 v0 h1 v0 h1 v-2 h1 v6 h1 v0 h1 v1 h1 v0 h1 v5 h1 v2 h1 v-4 h1 v0 h1 v3 h1 v0 h1 v1 h1 v2 h1 v6 h1 v2 h1 v-1 h1 v0 h1 v-5 h1 v-4 h1 v2 h1 v-7 h1 v3 h1 v-6 h1 v4 h1 v-2 h1 v-7 h1 v-1 h1 v-3 h1 v-1 h1 v-15 h1 v-11 h1 v-2 h1 v22 h1 v-2 h1 v-3 h1 v-1 h1 v-1 h1 v-4 h1 v-2 h1 v6 h1 v-1 h1 v0 h1 v101Z"
            transform="scale(0.317076923076923 0.358434782608696)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MA</text>
        </g>
        <g
          id="Rhode Island-bars"
          transform="translate(459.585 88.3)"
        >
          <path
            id="Rhode Island-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v3 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v-5 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v6 h1 v-3 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v-1 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v2 h1 v-8 h1 v-1 h1 v4 h1 v5 h1 v-1 h1 v-5 h1 v-11 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v4 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v31Z"
            transform="scale(0.317076923076923 1.11405405405405)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >RI</text>
        </g>
        <g
          id="Oregon-bars"
          transform="translate(0 132.07)"
        >
          <path
            id="Oregon-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v-3 h1 v2 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-8 h1 v-4 h1 v-12 h1 v1 h1 v-4 h1 v-3 h1 v-8 h1 v-10 h1 v1 h1 v-3 h1 v-4 h1 v8 h1 v6 h1 v4 h1 v-6 h1 v3 h1 v-5 h1 v-1 h1 v-5 h1 v-4 h1 v-8 h1 v-17 h1 v-8 h1 v-13 h1 v0 h1 v-14 h1 v-12 h1 v-4 h1 v-5 h1 v3 h1 v-9 h1 v-1 h1 v-14 h1 v-2 h1 v-10 h1 v-11 h1 v-11 h1 v-18 h1 v-3 h1 v-3 h1 v2 h1 v-3 h1 v1 h1 v-10 h1 v-4 h1 v-4 h1 v-10 h1 v-3 h1 v-1 h1 v4 h1 v6 h1 v-2 h1 v-4 h1 v-2 h1 v0 h1 v-2 h1 v-1 h1 v-18 h1 v-3 h1 v-2 h1 v-14 h1 v1 h1 v-10 h1 v-13 h1 v-9 h1 v7 h1 v0 h1 v8 h1 v4 h1 v-5 h1 v11 h1 v0 h1 v-21 h1 v9 h1 v0 h1 v-6 h1 v7 h1 v-1 h1 v24 h1 v-2 h1 v4 h1 v1 h1 v4 h1 v3 h1 v14 h1 v3 h1 v4 h1 v10 h1 v54 h1 v-3 h1 v-4 h1 v7 h1 v2 h1 v-3 h1 v6 h1 v-3 h1 v-2 h1 v1 h1 v-5 h1 v-10 h1 v-9 h1 v6 h1 v-3 h1 v6 h1 v-7 h1 v11 h1 v-2 h1 v0 h1 v-4 h1 v0 h1 v2 h1 v-4 h1 v2 h1 v1 h1 v-5 h1 v-1 h1 v206Z"
            transform="scale(0.317076923076923 0.130031545741325)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >OR</text>
        </g>
        <g
          id="Nevada-bars"
          transform="translate(43.77 132.07)"
        >
          <path
            id="Nevada-counts"
            class="state-trend"
            d="M0,0 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-2 h1 v1 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v2 h1 v-2 h1 v0 h1 v3 h1 v-1 h1 v3 h1 v-1 h1 v-8 h1 v-1 h1 v-11 h1 v-2 h1 v-1 h1 v4 h1 v1 h1 v0 h1 v0 h1 v-3 h1 v-6 h1 v7 h1 v4 h1 v5 h1 v-3 h1 v2 h1 v2 h1 v1 h1 v0 h1 v-2 h1 v1 h1 v2 h1 v1 h1 v1 h1 v-2 h1 v-2 h1 v1 h1 v0 h1 v-4 h1 v0 h1 v3 h1 v-1 h1 v-6 h1 v-4 h1 v-5 h1 v-5 h1 v-3 h1 v-9 h1 v0 h1 v-1 h1 v-3 h1 v1 h1 v0 h1 v1 h1 v3 h1 v0 h1 v-3 h1 v0 h1 v-2 h1 v-3 h1 v-5 h1 v-3 h1 v-8 h1 v-2 h1 v-8 h1 v-8 h1 v-2 h1 v3 h1 v-1 h1 v0 h1 v1 h1 v4 h1 v3 h1 v-2 h1 v-3 h1 v-5 h1 v-10 h1 v0 h1 v-1 h1 v0 h1 v13 h1 v9 h1 v2 h1 v-6 h1 v-1 h1 v2 h1 v2 h1 v-13 h1 v-13 h1 v-14 h1 v-12 h1 v-7 h1 v-5 h1 v1 h1 v16 h1 v4 h1 v0 h1 v4 h1 v-1 h1 v2 h1 v-2 h1 v-12 h1 v-7 h1 v14 h1 v-7 h1 v-5 h1 v1 h1 v5 h1 v3 h1 v-1 h1 v-4 h1 v2 h1 v0 h1 v-12 h1 v7 h1 v1 h1 v-1 h1 v-1 h1 v137Z"
            transform="scale(0.317076923076923 0.28625)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NV</text>
        </g>
        <g
          id="Wyoming-bars"
          transform="translate(87.54 132.07)"
        >
          <path
            id="Wyoming-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v1 h1 v1 h1 v0 h1 v-3 h1 v-2 h1 v-4 h1 v1 h1 v4 h1 v1 h1 v0 h1 v1 h1 v-8 h1 v-9 h1 v5 h1 v-8 h1 v-9 h1 v-17 h1 v0 h1 v4 h1 v-3 h1 v-2 h1 v-3 h1 v-5 h1 v2 h1 v2 h1 v19 h1 v0 h1 v1 h1 v5 h1 v-10 h1 v-8 h1 v-11 h1 v1 h1 v5 h1 v-2 h1 v-1 h1 v-2 h1 v-1 h1 v-5 h1 v-30 h1 v-7 h1 v-4 h1 v-8 h1 v-3 h1 v0 h1 v-3 h1 v-14 h1 v-21 h1 v-3 h1 v-8 h1 v-17 h1 v-7 h1 v-6 h1 v-4 h1 v16 h1 v-1 h1 v0 h1 v-8 h1 v2 h1 v3 h1 v-4 h1 v5 h1 v-9 h1 v-5 h1 v8 h1 v3 h1 v-5 h1 v-8 h1 v7 h1 v13 h1 v7 h1 v4 h1 v44 h1 v0 h1 v3 h1 v-13 h1 v-19 h1 v4 h1 v-11 h1 v0 h1 v5 h1 v3 h1 v23 h1 v-4 h1 v3 h1 v19 h1 v-8 h1 v5 h1 v-4 h1 v-8 h1 v2 h1 v-6 h1 v-6 h1 v16 h1 v7 h1 v-3 h1 v8 h1 v15 h1 v8 h1 v3 h1 v-2 h1 v-4 h1 v-4 h1 v-2 h1 v-7 h1 v-6 h1 v10 h1 v0 h1 v1 h1 v1 h1 v1 h1 v-2 h1 v-2 h1 v2 h1 v1 h1 v-6 h1 v3 h1 v2 h1 v6 h1 v-3 h1 v95Z"
            transform="scale(0.317076923076923 0.205074626865672)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >WY</text>
        </g>
        <g
          id="South Dakota-bars"
          transform="translate(131.31 132.07)"
        >
          <path
            id="South Dakota-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v-1 h1 v-4 h1 v0 h1 v0 h1 v-1 h1 v-7 h1 v-2 h1 v5 h1 v-1 h1 v-1 h1 v-8 h1 v1 h1 v-22 h1 v-1 h1 v-3 h1 v-5 h1 v-4 h1 v-9 h1 v0 h1 v0 h1 v-3 h1 v-2 h1 v-5 h1 v0 h1 v0 h1 v2 h1 v-6 h1 v-1 h1 v-3 h1 v-7 h1 v0 h1 v0 h1 v-4 h1 v-3 h1 v0 h1 v-3 h1 v6 h1 v1 h1 v-4 h1 v8 h1 v0 h1 v1 h1 v-3 h1 v-5 h1 v2 h1 v-4 h1 v1 h1 v5 h1 v-2 h1 v-7 h1 v3 h1 v-7 h1 v2 h1 v3 h1 v-18 h1 v-14 h1 v10 h1 v1 h1 v-2 h1 v0 h1 v0 h1 v4 h1 v5 h1 v-1 h1 v6 h1 v7 h1 v-4 h1 v-3 h1 v0 h1 v7 h1 v1 h1 v-1 h1 v2 h1 v0 h1 v-3 h1 v2 h1 v1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v2 h1 v103Z"
            transform="scale(0.317076923076923 0.305333333333333)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >SD</text>
        </g>
        <g
          id="Iowa-bars"
          transform="translate(175.08 132.07)"
        >
          <path
            id="Iowa-counts"
            class="state-trend"
            d="M0,0 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v-3 h1 v-4 h1 v-2 h1 v1 h1 v-1 h1 v-4 h1 v-3 h1 v-4 h1 v0 h1 v-1 h1 v0 h1 v4 h1 v0 h1 v0 h1 v7 h1 v-3 h1 v-1 h1 v0 h1 v2 h1 v-6 h1 v-6 h1 v-4 h1 v0 h1 v-5 h1 v-1 h1 v-3 h1 v-5 h1 v-12 h1 v0 h1 v2 h1 v0 h1 v1 h1 v-10 h1 v-2 h1 v-1 h1 v-5 h1 v-3 h1 v-1 h1 v0 h1 v-7 h1 v0 h1 v-3 h1 v-4 h1 v-4 h1 v-3 h1 v-7 h1 v-2 h1 v-2 h1 v0 h1 v-2 h1 v-3 h1 v0 h1 v-3 h1 v-1 h1 v-1 h1 v0 h1 v6 h1 v0 h1 v-4 h1 v-2 h1 v7 h1 v6 h1 v-3 h1 v1 h1 v-10 h1 v0 h1 v2 h1 v5 h1 v2 h1 v4 h1 v1 h1 v-1 h1 v-4 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v2 h1 v-2 h1 v1 h1 v-2 h1 v2 h1 v1 h1 v1 h1 v3 h1 v-1 h1 v-6 h1 v-6 h1 v-2 h1 v-3 h1 v1 h1 v5 h1 v-2 h1 v-3 h1 v4 h1 v-3 h1 v-11 h1 v-3 h1 v-6 h1 v0 h1 v-3 h1 v9 h1 v-3 h1 v5 h1 v0 h1 v138Z"
            transform="scale(0.317076923076923 0.276644295302013)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >IA</text>
        </g>
        <g
          id="Illinois-bars"
          transform="translate(218.85 132.07)"
        >
          <path
            id="Illinois-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v-9 h1 v-6 h1 v-2 h1 v1 h1 v16 h1 v0 h1 v-18 h1 v-5 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v-3 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v1 h1 v0 h1 v-4 h1 v-1 h1 v-1 h1 v-2 h1 v0 h1 v5 h1 v-7 h1 v-1 h1 v-5 h1 v3 h1 v-3 h1 v-33 h1 v-15 h1 v-2 h1 v-4 h1 v-2 h1 v-12 h1 v-5 h1 v0 h1 v2 h1 v-15 h1 v-12 h1 v-9 h1 v-7 h1 v-3 h1 v0 h1 v-3 h1 v0 h1 v2 h1 v-2 h1 v15 h1 v-5 h1 v-1 h1 v-3 h1 v2 h1 v1 h1 v-1 h1 v-4 h1 v-2 h1 v-7 h1 v-3 h1 v-3 h1 v-4 h1 v17 h1 v-5 h1 v-2 h1 v-1 h1 v6 h1 v0 h1 v0 h1 v-8 h1 v1 h1 v-4 h1 v7 h1 v22 h1 v0 h1 v0 h1 v2 h1 v4 h1 v0 h1 v-6 h1 v-8 h1 v1 h1 v-4 h1 v4 h1 v1 h1 v-3 h1 v0 h1 v2 h1 v0 h1 v0 h1 v-3 h1 v-3 h1 v0 h1 v-5 h1 v3 h1 v-2 h1 v-2 h1 v-2 h1 v-6 h1 v1 h1 v-7 h1 v-4 h1 v-3 h1 v-4 h1 v-1 h1 v4 h1 v1 h1 v4 h1 v-10 h1 v8 h1 v185Z"
            transform="scale(0.317076923076923 0.213575129533679)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >IL</text>
        </g>
        <g
          id="Indiana-bars"
          transform="translate(262.62 132.07)"
        >
          <path
            id="Indiana-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v-1 h1 v-3 h1 v2 h1 v-4 h1 v-4 h1 v-2 h1 v-4 h1 v-7 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-8 h1 v-4 h1 v-3 h1 v-2 h1 v-12 h1 v-4 h1 v-3 h1 v-5 h1 v-4 h1 v-14 h1 v-7 h1 v-1 h1 v2 h1 v-5 h1 v0 h1 v-3 h1 v-9 h1 v-2 h1 v-8 h1 v-3 h1 v-5 h1 v-4 h1 v-4 h1 v-1 h1 v-2 h1 v-7 h1 v-2 h1 v-6 h1 v-5 h1 v-13 h1 v-11 h1 v-10 h1 v8 h1 v4 h1 v10 h1 v0 h1 v-1 h1 v4 h1 v1 h1 v1 h1 v-3 h1 v-9 h1 v7 h1 v10 h1 v-2 h1 v2 h1 v-3 h1 v-1 h1 v1 h1 v1 h1 v-8 h1 v-1 h1 v8 h1 v0 h1 v9 h1 v1 h1 v1 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v3 h1 v9 h1 v3 h1 v24 h1 v-3 h1 v1 h1 v-5 h1 v-12 h1 v-3 h1 v-6 h1 v-6 h1 v-4 h1 v-7 h1 v10 h1 v3 h1 v-20 h1 v-4 h1 v-4 h1 v0 h1 v181Z"
            transform="scale(0.317076923076923 0.20713567839196)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >IN</text>
        </g>
        <g
          id="Ohio-bars"
          transform="translate(306.39 132.07)"
        >
          <path
            id="Ohio-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-2 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-4 h1 v-12 h1 v-3 h1 v4 h1 v1 h1 v-1 h1 v0 h1 v-23 h1 v-2 h1 v-13 h1 v-7 h1 v-15 h1 v-10 h1 v-5 h1 v1 h1 v-3 h1 v-2 h1 v-5 h1 v10 h1 v1 h1 v0 h1 v42 h1 v0 h1 v-5 h1 v-23 h1 v-28 h1 v-8 h1 v-10 h1 v-9 h1 v-5 h1 v-1 h1 v-7 h1 v-15 h1 v6 h1 v4 h1 v2 h1 v-2 h1 v8 h1 v-7 h1 v4 h1 v-3 h1 v0 h1 v1 h1 v-2 h1 v6 h1 v0 h1 v-5 h1 v1 h1 v-2 h1 v-3 h1 v-3 h1 v-10 h1 v-2 h1 v-3 h1 v-4 h1 v1 h1 v-3 h1 v4 h1 v-1 h1 v-4 h1 v12 h1 v4 h1 v-3 h1 v-2 h1 v-4 h1 v6 h1 v-4 h1 v31 h1 v4 h1 v1 h1 v2 h1 v5 h1 v1 h1 v-7 h1 v-5 h1 v5 h1 v-1 h1 v7 h1 v0 h1 v3 h1 v2 h1 v-3 h1 v-1 h1 v0 h1 v6 h1 v-2 h1 v-1 h1 v-16 h1 v2 h1 v-2 h1 v4 h1 v-4 h1 v-3 h1 v-9 h1 v2 h1 v-17 h1 v7 h1 v-8 h1 v-17 h1 v1 h1 v-10 h1 v-13 h1 v-2 h1 v-22 h1 v-2 h1 v228Z"
            transform="scale(0.317076923076923 0.180789473684211)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >OH</text>
        </g>
        <g
          id="Pennsylvania-bars"
          transform="translate(350.16 132.07)"
        >
          <path
            id="Pennsylvania-counts"
            class="state-trend"
            d="M0,0 v-3 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-1 h1 v-7 h1 v-6 h1 v-5 h1 v-7 h1 v-2 h1 v-3 h1 v-10 h1 v3 h1 v-2 h1 v2 h1 v0 h1 v-11 h1 v-3 h1 v-1 h1 v0 h1 v2 h1 v1 h1 v-3 h1 v-1 h1 v-3 h1 v0 h1 v-8 h1 v-1 h1 v-8 h1 v-3 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v-6 h1 v-10 h1 v-13 h1 v-18 h1 v-11 h1 v0 h1 v-6 h1 v-3 h1 v0 h1 v1 h1 v-3 h1 v-10 h1 v-1 h1 v1 h1 v-1 h1 v2 h1 v3 h1 v-5 h1 v-1 h1 v-1 h1 v-3 h1 v6 h1 v0 h1 v-8 h1 v-6 h1 v-4 h1 v-8 h1 v-13 h1 v-18 h1 v-6 h1 v-8 h1 v-3 h1 v-2 h1 v1 h1 v-3 h1 v-5 h1 v-6 h1 v-11 h1 v-3 h1 v5 h1 v-2 h1 v20 h1 v3 h1 v19 h1 v-1 h1 v1 h1 v-1 h1 v-7 h1 v1 h1 v-5 h1 v-2 h1 v1 h1 v3 h1 v2 h1 v8 h1 v-4 h1 v1 h1 v12 h1 v11 h1 v-3 h1 v-4 h1 v9 h1 v-4 h1 v2 h1 v-4 h1 v-4 h1 v0 h1 v-5 h1 v-8 h1 v1 h1 v-8 h1 v-10 h1 v4 h1 v-10 h1 v-2 h1 v-12 h1 v-5 h1 v-2 h1 v-4 h1 v10 h1 v2 h1 v-10 h1 v275Z"
            transform="scale(0.317076923076923 0.148808664259928)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >PA</text>
        </g>
        <g
          id="New Jersey-bars"
          transform="translate(393.93 132.07)"
        >
          <path
            id="New Jersey-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-7 h1 v0 h1 v1 h1 v3 h1 v0 h1 v2 h1 v0 h1 v0 h1 v2 h1 v-2 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v-16 h1 v-6 h1 v-5 h1 v0 h1 v-2 h1 v1 h1 v-2 h1 v-2 h1 v0 h1 v-2 h1 v-3 h1 v-5 h1 v-2 h1 v-6 h1 v-1 h1 v-1 h1 v-5 h1 v2 h1 v-4 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v-3 h1 v-2 h1 v-2 h1 v2 h1 v0 h1 v-3 h1 v4 h1 v-1 h1 v-1 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v-1 h1 v-2 h1 v-2 h1 v-3 h1 v0 h1 v-1 h1 v3 h1 v-6 h1 v1 h1 v2 h1 v1 h1 v5 h1 v-14 h1 v-2 h1 v-1 h1 v-3 h1 v0 h1 v-3 h1 v1 h1 v6 h1 v-1 h1 v1 h1 v2 h1 v5 h1 v3 h1 v-3 h1 v0 h1 v-9 h1 v0 h1 v2 h1 v5 h1 v1 h1 v2 h1 v2 h1 v-3 h1 v0 h1 v1 h1 v-3 h1 v-11 h1 v-5 h1 v2 h1 v-3 h1 v0 h1 v-8 h1 v2 h1 v-8 h1 v-6 h1 v-4 h1 v8 h1 v7 h1 v2 h1 v0 h1 v0 h1 v-3 h1 v115Z"
            transform="scale(0.317076923076923 0.31953488372093)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NJ</text>
        </g>
        <g
          id="Connecticut-bars"
          transform="translate(437.7 132.07)"
        >
          <path
            id="Connecticut-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v-1 h1 v-7 h1 v-4 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-3 h1 v-2 h1 v0 h1 v-3 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v2 h1 v-4 h1 v-1 h1 v-6 h1 v2 h1 v-6 h1 v-8 h1 v-13 h1 v2 h1 v-1 h1 v-1 h1 v-10 h1 v-4 h1 v3 h1 v8 h1 v1 h1 v18 h1 v2 h1 v5 h1 v3 h1 v-2 h1 v8 h1 v-2 h1 v-2 h1 v1 h1 v1 h1 v6 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v1 h1 v-2 h1 v0 h1 v3 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-3 h1 v3 h1 v0 h1 v-5 h1 v0 h1 v-4 h1 v1 h1 v-2 h1 v0 h1 v1 h1 v-3 h1 v-4 h1 v-2 h1 v-3 h1 v-5 h1 v-1 h1 v1 h1 v3 h1 v0 h1 v-2 h1 v3 h1 v-1 h1 v-1 h1 v0 h1 v64Z"
            transform="scale(0.317076923076923 0.44804347826087)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >CT</text>
        </g>
        <g
          id="California-bars"
          transform="translate(21.885 175.84)"
        >
          <path
            id="California-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v-2 h1 v0 h1 v-2 h1 v1 h1 v-5 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v0 h1 v-6 h1 v-4 h1 v-5 h1 v-7 h1 v-6 h1 v-4 h1 v-7 h1 v2 h1 v-8 h1 v-26 h1 v-58 h1 v-15 h1 v30 h1 v0 h1 v15 h1 v-19 h1 v-4 h1 v0 h1 v-2 h1 v-14 h1 v-25 h1 v-11 h1 v-9 h1 v-4 h1 v-13 h1 v-1 h1 v-26 h1 v-27 h1 v-35 h1 v-32 h1 v8 h1 v16 h1 v-1 h1 v10 h1 v-3 h1 v-9 h1 v11 h1 v-7 h1 v-41 h1 v-17 h1 v-1 h1 v-5 h1 v-18 h1 v-7 h1 v-5 h1 v-18 h1 v-17 h1 v-13 h1 v-14 h1 v-33 h1 v-30 h1 v-19 h1 v-11 h1 v-13 h1 v-5 h1 v-29 h1 v-55 h1 v-52 h1 v-30 h1 v-42 h1 v-22 h1 v-5 h1 v-24 h1 v-11 h1 v-28 h1 v-11 h1 v8 h1 v-13 h1 v-2 h1 v-17 h1 v6 h1 v7 h1 v22 h1 v-11 h1 v-1 h1 v6 h1 v4 h1 v42 h1 v8 h1 v1 h1 v47 h1 v31 h1 v25 h1 v-4 h1 v19 h1 v-30 h1 v-6 h1 v-14 h1 v-40 h1 v-7 h1 v19 h1 v28 h1 v-22 h1 v35 h1 v-14 h1 v11 h1 v-16 h1 v-27 h1 v-15 h1 v-23 h1 v8 h1 v5 h1 v-15 h1 v36 h1 v-9 h1 v-30 h1 v-2 h1 v9 h1 v-19 h1 v17 h1 v-16 h1 v18 h1 v-16 h1 v5 h1 v20 h1 v25 h1 v-21 h1 v19 h1 v792Z"
            transform="scale(0.317076923076923 0.0454465270121279)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >CA</text>
        </g>
        <g
          id="Utah-bars"
          transform="translate(65.655 175.84)"
        >
          <path
            id="Utah-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-3 h1 v-11 h1 v-1 h1 v-8 h1 v-1 h1 v-5 h1 v-10 h1 v-3 h1 v5 h1 v5 h1 v-6 h1 v5 h1 v0 h1 v-6 h1 v-3 h1 v3 h1 v0 h1 v1 h1 v2 h1 v-6 h1 v1 h1 v-3 h1 v1 h1 v0 h1 v-3 h1 v-2 h1 v1 h1 v-2 h1 v3 h1 v-7 h1 v-10 h1 v-13 h1 v-5 h1 v-3 h1 v-15 h1 v-13 h1 v-1 h1 v-5 h1 v-17 h1 v-6 h1 v-7 h1 v-28 h1 v-24 h1 v-7 h1 v3 h1 v-8 h1 v-5 h1 v42 h1 v-3 h1 v-13 h1 v13 h1 v-6 h1 v-17 h1 v7 h1 v4 h1 v-26 h1 v-29 h1 v-5 h1 v-2 h1 v6 h1 v27 h1 v0 h1 v13 h1 v-14 h1 v3 h1 v8 h1 v-17 h1 v3 h1 v-15 h1 v8 h1 v-10 h1 v-27 h1 v-5 h1 v65 h1 v6 h1 v6 h1 v12 h1 v-10 h1 v31 h1 v1 h1 v-5 h1 v4 h1 v5 h1 v2 h1 v1 h1 v4 h1 v12 h1 v9 h1 v6 h1 v1 h1 v-2 h1 v-2 h1 v-5 h1 v-1 h1 v-1 h1 v5 h1 v0 h1 v-3 h1 v6 h1 v1 h1 v0 h1 v-4 h1 v-3 h1 v-3 h1 v8 h1 v-1 h1 v-3 h1 v-2 h1 v2 h1 v0 h1 v-1 h1 v137Z"
            transform="scale(0.317076923076923 0.148273381294964)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >UT</text>
        </g>
        <g
          id="Colorado-bars"
          transform="translate(109.425 175.84)"
        >
          <path
            id="Colorado-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v-4 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v-2 h1 v-3 h1 v1 h1 v-19 h1 v4 h1 v8 h1 v-3 h1 v-1 h1 v-3 h1 v-33 h1 v-15 h1 v2 h1 v-11 h1 v-2 h1 v3 h1 v0 h1 v-5 h1 v8 h1 v2 h1 v4 h1 v-5 h1 v-9 h1 v-11 h1 v1 h1 v4 h1 v-3 h1 v-4 h1 v6 h1 v-14 h1 v1 h1 v-1 h1 v-1 h1 v-6 h1 v-5 h1 v-14 h1 v-13 h1 v-23 h1 v-13 h1 v-17 h1 v-13 h1 v-1 h1 v-27 h1 v-4 h1 v-13 h1 v-8 h1 v3 h1 v-5 h1 v-5 h1 v3 h1 v-12 h1 v-11 h1 v6 h1 v-2 h1 v6 h1 v11 h1 v1 h1 v-7 h1 v-4 h1 v-8 h1 v-1 h1 v0 h1 v-8 h1 v-14 h1 v-13 h1 v-1 h1 v-16 h1 v8 h1 v2 h1 v3 h1 v12 h1 v-5 h1 v3 h1 v0 h1 v-23 h1 v-20 h1 v-24 h1 v-3 h1 v-33 h1 v-4 h1 v22 h1 v39 h1 v29 h1 v26 h1 v-24 h1 v5 h1 v17 h1 v15 h1 v-8 h1 v6 h1 v2 h1 v-11 h1 v-2 h1 v8 h1 v-17 h1 v10 h1 v14 h1 v12 h1 v7 h1 v6 h1 v-2 h1 v-6 h1 v-6 h1 v7 h1 v7 h1 v1 h1 v0 h1 v21 h1 v5 h1 v0 h1 v5 h1 v1 h1 v-1 h1 v1 h1 v-2 h1 v-3 h1 v3 h1 v0 h1 v-4 h1 v247Z"
            transform="scale(0.317076923076923 0.0958604651162791)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >CO</text>
        </g>
        <g
          id="Nebraska-bars"
          transform="translate(153.195 175.84)"
        >
          <path
            id="Nebraska-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-8 h1 v-5 h1 v-7 h1 v-10 h1 v-3 h1 v0 h1 v-5 h1 v-3 h1 v-1 h1 v-8 h1 v-3 h1 v-1 h1 v-14 h1 v-7 h1 v5 h1 v-4 h1 v-4 h1 v-6 h1 v-11 h1 v-8 h1 v-14 h1 v-19 h1 v-8 h1 v-11 h1 v-8 h1 v8 h1 v-8 h1 v-4 h1 v10 h1 v-2 h1 v7 h1 v-4 h1 v0 h1 v-7 h1 v-1 h1 v0 h1 v8 h1 v5 h1 v-2 h1 v-1 h1 v-7 h1 v14 h1 v0 h1 v2 h1 v5 h1 v0 h1 v-2 h1 v5 h1 v1 h1 v-9 h1 v-8 h1 v3 h1 v1 h1 v5 h1 v-7 h1 v0 h1 v1 h1 v-1 h1 v2 h1 v-3 h1 v3 h1 v-3 h1 v1 h1 v26 h1 v2 h1 v11 h1 v28 h1 v4 h1 v-9 h1 v-1 h1 v7 h1 v0 h1 v0 h1 v-2 h1 v-7 h1 v1 h1 v4 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v2 h1 v-4 h1 v2 h1 v0 h1 v-1 h1 v-5 h1 v0 h1 v-3 h1 v-9 h1 v1 h1 v109Z"
            transform="scale(0.317076923076923 0.243905325443787)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NE</text>
        </g>
        <g
          id="Missouri-bars"
          transform="translate(196.965 175.84)"
        >
          <path
            id="Missouri-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-21 h1 v-14 h1 v-4 h1 v-4 h1 v-3 h1 v-1 h1 v-4 h1 v-8 h1 v-4 h1 v0 h1 v-2 h1 v-4 h1 v2 h1 v-3 h1 v-3 h1 v-2 h1 v1 h1 v-3 h1 v-4 h1 v0 h1 v3 h1 v1 h1 v-1 h1 v-1 h1 v-4 h1 v0 h1 v-1 h1 v-17 h1 v-3 h1 v-5 h1 v1 h1 v0 h1 v-1 h1 v-3 h1 v-7 h1 v-3 h1 v-4 h1 v-3 h1 v3 h1 v-4 h1 v0 h1 v-5 h1 v0 h1 v-2 h1 v-12 h1 v-6 h1 v2 h1 v-2 h1 v4 h1 v3 h1 v7 h1 v13 h1 v0 h1 v0 h1 v10 h1 v7 h1 v3 h1 v-1 h1 v-1 h1 v-3 h1 v11 h1 v3 h1 v-1 h1 v4 h1 v1 h1 v0 h1 v-2 h1 v-4 h1 v3 h1 v6 h1 v3 h1 v0 h1 v-5 h1 v-2 h1 v-2 h1 v-6 h1 v-17 h1 v-4 h1 v-8 h1 v-11 h1 v-21 h1 v-1 h1 v-2 h1 v0 h1 v-7 h1 v-2 h1 v-22 h1 v-4 h1 v2 h1 v-1 h1 v-4 h1 v-2 h1 v-8 h1 v-2 h1 v-4 h1 v-4 h1 v-2 h1 v0 h1 v232Z"
            transform="scale(0.317076923076923 0.177672413793103)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MO</text>
        </g>
        <g
          id="Kentucky-bars"
          transform="translate(240.735 175.84)"
        >
          <path
            id="Kentucky-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v-9 h1 v2 h1 v1 h1 v3 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-4 h1 v0 h1 v-1 h1 v-9 h1 v-4 h1 v-4 h1 v24 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-4 h1 v-27 h1 v-15 h1 v-13 h1 v-6 h1 v0 h1 v1 h1 v-4 h1 v0 h1 v-1 h1 v1 h1 v-3 h1 v-2 h1 v-1 h1 v-4 h1 v-4 h1 v-3 h1 v-7 h1 v-2 h1 v-5 h1 v-5 h1 v0 h1 v0 h1 v-4 h1 v5 h1 v1 h1 v-1 h1 v-2 h1 v1 h1 v-1 h1 v-5 h1 v-7 h1 v0 h1 v-1 h1 v7 h1 v1 h1 v1 h1 v-4 h1 v14 h1 v3 h1 v2 h1 v5 h1 v-2 h1 v-3 h1 v3 h1 v2 h1 v10 h1 v5 h1 v-2 h1 v3 h1 v-3 h1 v-3 h1 v-11 h1 v-3 h1 v1 h1 v17 h1 v-5 h1 v18 h1 v0 h1 v-5 h1 v-10 h1 v-4 h1 v-15 h1 v3 h1 v-11 h1 v-8 h1 v2 h1 v4 h1 v4 h1 v0 h1 v-6 h1 v0 h1 v-5 h1 v-6 h1 v1 h1 v-8 h1 v-3 h1 v-1 h1 v4 h1 v-5 h1 v-5 h1 v-4 h1 v154Z"
            transform="scale(0.317076923076923 0.267662337662338)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >KY</text>
        </g>
        <g
          id="West Virginia-bars"
          transform="translate(284.505 175.84)"
        >
          <path
            id="West Virginia-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v1 h1 v-2 h1 v-1 h1 v1 h1 v2 h1 v0 h1 v-4 h1 v-9 h1 v-5 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-16 h1 v18 h1 v8 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v-1 h1 v-4 h1 v-4 h1 v0 h1 v5 h1 v-2 h1 v-14 h1 v-14 h1 v-4 h1 v10 h1 v-1 h1 v0 h1 v-1 h1 v1 h1 v-2 h1 v-7 h1 v-9 h1 v-2 h1 v-12 h1 v-2 h1 v0 h1 v-3 h1 v-3 h1 v-7 h1 v-7 h1 v-1 h1 v1 h1 v0 h1 v2 h1 v2 h1 v4 h1 v0 h1 v1 h1 v-2 h1 v-2 h1 v0 h1 v3 h1 v-1 h1 v1 h1 v1 h1 v-2 h1 v3 h1 v-5 h1 v1 h1 v-5 h1 v-3 h1 v-3 h1 v-3 h1 v1 h1 v-3 h1 v0 h1 v2 h1 v-12 h1 v3 h1 v-5 h1 v14 h1 v-2 h1 v1 h1 v3 h1 v3 h1 v28 h1 v9 h1 v1 h1 v-10 h1 v-2 h1 v4 h1 v-4 h1 v1 h1 v0 h1 v0 h1 v3 h1 v8 h1 v3 h1 v3 h1 v-9 h1 v0 h1 v2 h1 v0 h1 v-3 h1 v0 h1 v-2 h1 v0 h1 v1 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v-5 h1 v0 h1 v-3 h1 v-6 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v2 h1 v84Z"
            transform="scale(0.317076923076923 0.346386554621849)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >WV</text>
        </g>
        <g
          id="Maryland-bars"
          transform="translate(328.275 175.84)"
        >
          <path
            id="Maryland-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-3 h1 v-8 h1 v-1 h1 v-2 h1 v-3 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v0 h1 v-2 h1 v-2 h1 v0 h1 v-8 h1 v-1 h1 v-1 h1 v-10 h1 v-13 h1 v-6 h1 v-5 h1 v-6 h1 v2 h1 v1 h1 v0 h1 v0 h1 v6 h1 v-6 h1 v7 h1 v-2 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v-2 h1 v-9 h1 v-8 h1 v1 h1 v0 h1 v2 h1 v0 h1 v3 h1 v-1 h1 v4 h1 v2 h1 v-4 h1 v6 h1 v-1 h1 v1 h1 v-3 h1 v5 h1 v-1 h1 v-5 h1 v3 h1 v1 h1 v-2 h1 v2 h1 v2 h1 v4 h1 v-1 h1 v5 h1 v-4 h1 v2 h1 v-2 h1 v4 h1 v-10 h1 v0 h1 v-9 h1 v-8 h1 v-13 h1 v-5 h1 v3 h1 v0 h1 v-1 h1 v4 h1 v-10 h1 v-9 h1 v-5 h1 v2 h1 v-1 h1 v-1 h1 v-1 h1 v-8 h1 v1 h1 v3 h1 v-4 h1 v-2 h1 v2 h1 v144Z"
            transform="scale(0.317076923076923 0.282328767123288)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MD</text>
        </g>
        <g
          id="Delaware-bars"
          transform="translate(372.045 175.84)"
        >
          <path
            id="Delaware-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v2 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v1 h1 v3 h1 v2 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-1 h1 v-2 h1 v0 h1 v2 h1 v1 h1 v-1 h1 v-1 h1 v-4 h1 v5 h1 v-6 h1 v-1 h1 v0 h1 v-1 h1 v7 h1 v1 h1 v0 h1 v-5 h1 v5 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v2 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v18Z"
            transform="scale(0.317076923076923 1.79217391304348)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >DE</text>
        </g>
        <g
          id="District of Columbia-bars"
          transform="translate(415.815 175.84)"
        >
          <path
            id="District of Columbia-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v-1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v4Z"
            transform="scale(0.317076923076923 10.305)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >DC</text>
        </g>
        <g
          id="Arizona-bars"
          transform="translate(65.655 219.61)"
        >
          <path
            id="Arizona-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v-4 h1 v-3 h1 v4 h1 v1 h1 v0 h1 v2 h1 v0 h1 v-2 h1 v-2 h1 v-12 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v-2 h1 v-1 h1 v-2 h1 v-1 h1 v6 h1 v-2 h1 v-2 h1 v-2 h1 v-10 h1 v-5 h1 v-3 h1 v-1 h1 v16 h1 v-2 h1 v-15 h1 v1 h1 v0 h1 v-3 h1 v-3 h1 v-9 h1 v-4 h1 v1 h1 v-2 h1 v-7 h1 v3 h1 v11 h1 v-1 h1 v-6 h1 v-1 h1 v-7 h1 v-3 h1 v-3 h1 v-5 h1 v-2 h1 v-5 h1 v-5 h1 v-10 h1 v6 h1 v-8 h1 v-2 h1 v-11 h1 v-2 h1 v-7 h1 v-2 h1 v-8 h1 v-21 h1 v-13 h1 v-1 h1 v-6 h1 v3 h1 v1 h1 v16 h1 v0 h1 v1 h1 v-3 h1 v4 h1 v-2 h1 v10 h1 v-21 h1 v10 h1 v2 h1 v18 h1 v1 h1 v-2 h1 v1 h1 v6 h1 v-1 h1 v-3 h1 v-5 h1 v-10 h1 v-2 h1 v14 h1 v-3 h1 v-2 h1 v-15 h1 v-1 h1 v3 h1 v-4 h1 v-1 h1 v-11 h1 v4 h1 v-6 h1 v-2 h1 v20 h1 v-27 h1 v0 h1 v-1 h1 v-9 h1 v1 h1 v-1 h1 v-7 h1 v4 h1 v7 h1 v2 h1 v-4 h1 v10 h1 v-5 h1 v-4 h1 v193Z"
            transform="scale(0.317076923076923 0.203054187192118)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >AZ</text>
        </g>
        <g
          id="New Mexico-bars"
          transform="translate(109.425 219.61)"
        >
          <path
            id="New Mexico-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v-3 h1 v-1 h1 v2 h1 v-1 h1 v0 h1 v-1 h1 v-8 h1 v-4 h1 v4 h1 v2 h1 v-6 h1 v1 h1 v3 h1 v-4 h1 v5 h1 v-3 h1 v4 h1 v-3 h1 v-1 h1 v7 h1 v-7 h1 v-9 h1 v3 h1 v-2 h1 v-18 h1 v-6 h1 v-1 h1 v0 h1 v-4 h1 v-2 h1 v-14 h1 v-4 h1 v-3 h1 v-8 h1 v-1 h1 v3 h1 v-3 h1 v-8 h1 v-3 h1 v-3 h1 v-2 h1 v-2 h1 v0 h1 v-4 h1 v4 h1 v-5 h1 v-4 h1 v-4 h1 v-4 h1 v5 h1 v-10 h1 v-3 h1 v-6 h1 v-3 h1 v-7 h1 v-2 h1 v-7 h1 v-20 h1 v-2 h1 v0 h1 v4 h1 v2 h1 v6 h1 v-4 h1 v3 h1 v8 h1 v5 h1 v7 h1 v-3 h1 v-4 h1 v-1 h1 v-12 h1 v4 h1 v-3 h1 v2 h1 v-1 h1 v13 h1 v1 h1 v-2 h1 v3 h1 v7 h1 v0 h1 v1 h1 v-3 h1 v4 h1 v-2 h1 v-2 h1 v-7 h1 v10 h1 v5 h1 v8 h1 v-2 h1 v-2 h1 v3 h1 v-11 h1 v-5 h1 v1 h1 v-3 h1 v14 h1 v-9 h1 v-2 h1 v-3 h1 v0 h1 v2 h1 v1 h1 v3 h1 v1 h1 v1 h1 v3 h1 v-3 h1 v2 h1 v-11 h1 v1 h1 v146Z"
            transform="scale(0.317076923076923 0.234204545454545)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NM</text>
        </g>
        <g
          id="Kansas-bars"
          transform="translate(153.195 219.61)"
        >
          <path
            id="Kansas-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-6 h1 v1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v3 h1 v-1 h1 v5 h1 v3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-6 h1 v-5 h1 v-6 h1 v0 h1 v-5 h1 v-9 h1 v0 h1 v5 h1 v0 h1 v2 h1 v-2 h1 v-7 h1 v-12 h1 v0 h1 v8 h1 v1 h1 v0 h1 v-4 h1 v-1 h1 v-2 h1 v5 h1 v-12 h1 v-10 h1 v0 h1 v0 h1 v-4 h1 v0 h1 v-3 h1 v-5 h1 v-7 h1 v-3 h1 v-1 h1 v-4 h1 v-6 h1 v-3 h1 v-1 h1 v7 h1 v-10 h1 v-1 h1 v0 h1 v0 h1 v-3 h1 v-13 h1 v0 h1 v-9 h1 v-11 h1 v-7 h1 v-8 h1 v1 h1 v-4 h1 v-4 h1 v1 h1 v-1 h1 v7 h1 v3 h1 v3 h1 v-2 h1 v1 h1 v-1 h1 v-1 h1 v2 h1 v-5 h1 v-4 h1 v1 h1 v8 h1 v6 h1 v1 h1 v-2 h1 v4 h1 v4 h1 v0 h1 v-2 h1 v1 h1 v0 h1 v0 h1 v-8 h1 v-5 h1 v-2 h1 v-3 h1 v5 h1 v-4 h1 v6 h1 v0 h1 v2 h1 v-1 h1 v-6 h1 v-4 h1 v-2 h1 v3 h1 v7 h1 v0 h1 v-1 h1 v-9 h1 v4 h1 v-6 h1 v-4 h1 v2 h1 v-11 h1 v-5 h1 v-5 h1 v-1 h1 v0 h1 v183Z"
            transform="scale(0.317076923076923 0.225245901639344)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >KS</text>
        </g>
        <g
          id="Arkansas-bars"
          transform="translate(196.965 219.61)"
        >
          <path
            id="Arkansas-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-10 h1 v-3 h1 v-2 h1 v1 h1 v0 h1 v2 h1 v-3 h1 v-4 h1 v-6 h1 v-6 h1 v-6 h1 v-12 h1 v-2 h1 v-1 h1 v4 h1 v0 h1 v0 h1 v-3 h1 v-3 h1 v-2 h1 v0 h1 v-4 h1 v-5 h1 v-1 h1 v-3 h1 v0 h1 v-5 h1 v0 h1 v-1 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v-4 h1 v-1 h1 v-2 h1 v-1 h1 v1 h1 v-2 h1 v-2 h1 v1 h1 v7 h1 v12 h1 v1 h1 v2 h1 v1 h1 v0 h1 v5 h1 v0 h1 v12 h1 v0 h1 v0 h1 v6 h1 v3 h1 v2 h1 v0 h1 v4 h1 v-2 h1 v3 h1 v-5 h1 v-3 h1 v-4 h1 v-5 h1 v3 h1 v-2 h1 v0 h1 v12 h1 v-2 h1 v-7 h1 v-5 h1 v-8 h1 v-9 h1 v-7 h1 v-13 h1 v-4 h1 v3 h1 v2 h1 v-9 h1 v3 h1 v-7 h1 v-5 h1 v-8 h1 v10 h1 v-7 h1 v-5 h1 v-7 h1 v1 h1 v4 h1 v0 h1 v-6 h1 v-1 h1 v133Z"
            transform="scale(0.317076923076923 0.309924812030075)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >AR</text>
        </g>
        <g
          id="Tennessee-bars"
          transform="translate(240.735 219.61)"
        >
          <path
            id="Tennessee-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-4 h1 v1 h1 v0 h1 v-5 h1 v-3 h1 v1 h1 v0 h1 v2 h1 v2 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v2 h1 v0 h1 v-2 h1 v-9 h1 v-11 h1 v-2 h1 v-5 h1 v0 h1 v0 h1 v-11 h1 v0 h1 v-5 h1 v-1 h1 v-12 h1 v-6 h1 v-1 h1 v-16 h1 v12 h1 v-14 h1 v-2 h1 v-2 h1 v-1 h1 v-1 h1 v-5 h1 v-7 h1 v-1 h1 v0 h1 v0 h1 v-4 h1 v-3 h1 v-2 h1 v-3 h1 v4 h1 v0 h1 v-3 h1 v-4 h1 v0 h1 v-11 h1 v-5 h1 v-2 h1 v4 h1 v1 h1 v12 h1 v7 h1 v-5 h1 v9 h1 v1 h1 v-3 h1 v-7 h1 v-1 h1 v-21 h1 v-2 h1 v18 h1 v3 h1 v8 h1 v6 h1 v-1 h1 v6 h1 v6 h1 v-6 h1 v-6 h1 v5 h1 v-4 h1 v-1 h1 v1 h1 v21 h1 v-1 h1 v9 h1 v3 h1 v-5 h1 v-7 h1 v12 h1 v-4 h1 v4 h1 v0 h1 v17 h1 v-4 h1 v5 h1 v9 h1 v4 h1 v-6 h1 v-2 h1 v-8 h1 v-4 h1 v-3 h1 v-13 h1 v-4 h1 v-6 h1 v0 h1 v8 h1 v-4 h1 v-3 h1 v4 h1 v2 h1 v0 h1 v1 h1 v-2 h1 v-7 h1 v1 h1 v-4 h1 v10 h1 v-14 h1 v0 h1 v107Z"
            transform="scale(0.317076923076923 0.272980132450331)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >TN</text>
        </g>
        <g
          id="Virginia-bars"
          transform="translate(284.505 219.61)"
        >
          <path
            id="Virginia-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v3 h1 v0 h1 v-4 h1 v-5 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v2 h1 v5 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-16 h1 v-11 h1 v-10 h1 v-7 h1 v-12 h1 v-6 h1 v-1 h1 v0 h1 v3 h1 v0 h1 v-1 h1 v-3 h1 v-1 h1 v-4 h1 v-4 h1 v-1 h1 v-6 h1 v-14 h1 v-12 h1 v-9 h1 v-3 h1 v-7 h1 v-6 h1 v-7 h1 v-6 h1 v-7 h1 v-7 h1 v2 h1 v-1 h1 v-2 h1 v1 h1 v15 h1 v0 h1 v-1 h1 v6 h1 v1 h1 v-1 h1 v-1 h1 v-3 h1 v-1 h1 v-4 h1 v-4 h1 v-3 h1 v3 h1 v-2 h1 v-2 h1 v-1 h1 v0 h1 v-4 h1 v-6 h1 v-2 h1 v-4 h1 v3 h1 v-1 h1 v-10 h1 v-2 h1 v10 h1 v4 h1 v2 h1 v1 h1 v-1 h1 v17 h1 v3 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v2 h1 v-3 h1 v4 h1 v7 h1 v1 h1 v8 h1 v-1 h1 v1 h1 v-2 h1 v-14 h1 v-5 h1 v3 h1 v-3 h1 v-4 h1 v-1 h1 v-10 h1 v-1 h1 v7 h1 v-1 h1 v3 h1 v-6 h1 v-3 h1 v0 h1 v-8 h1 v-4 h1 v-3 h1 v1 h1 v194Z"
            transform="scale(0.317076923076923 0.211384615384615)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >VA</text>
        </g>
        <g
          id="North Carolina-bars"
          transform="translate(328.275 219.61)"
        >
          <path
            id="North Carolina-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-2 h1 v0 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v-1 h1 v-4 h1 v1 h1 v-1 h1 v-4 h1 v4 h1 v4 h1 v0 h1 v1 h1 v-5 h1 v0 h1 v-2 h1 v0 h1 v3 h1 v3 h1 v1 h1 v-3 h1 v-8 h1 v-3 h1 v-2 h1 v-3 h1 v-9 h1 v-7 h1 v2 h1 v-5 h1 v-16 h1 v-3 h1 v-6 h1 v3 h1 v-1 h1 v-1 h1 v-18 h1 v-5 h1 v0 h1 v-2 h1 v-5 h1 v-8 h1 v-9 h1 v1 h1 v-13 h1 v3 h1 v-2 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v-5 h1 v-6 h1 v3 h1 v-2 h1 v-2 h1 v9 h1 v-3 h1 v-2 h1 v1 h1 v0 h1 v-3 h1 v-3 h1 v-5 h1 v-4 h1 v-18 h1 v-4 h1 v-3 h1 v1 h1 v-4 h1 v0 h1 v2 h1 v15 h1 v0 h1 v10 h1 v-4 h1 v7 h1 v-3 h1 v0 h1 v-6 h1 v-1 h1 v-1 h1 v13 h1 v-1 h1 v-4 h1 v-3 h1 v-7 h1 v-11 h1 v-5 h1 v-4 h1 v5 h1 v15 h1 v1 h1 v1 h1 v-6 h1 v-9 h1 v2 h1 v-8 h1 v0 h1 v-8 h1 v-15 h1 v-7 h1 v4 h1 v-6 h1 v-1 h1 v-2 h1 v-2 h1 v-1 h1 v-1 h1 v-7 h1 v-4 h1 v9 h1 v-5 h1 v4 h1 v-1 h1 v-2 h1 v4 h1 v1 h1 v-1 h1 v-5 h1 v223Z"
            transform="scale(0.317076923076923 0.1815859030837)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >NC</text>
        </g>
        <g
          id="South Carolina-bars"
          transform="translate(372.045 219.61)"
        >
          <path
            id="South Carolina-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-1 h1 v-8 h1 v-3 h1 v1 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-9 h1 v-5 h1 v1 h1 v-6 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-6 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v2 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v2 h1 v-8 h1 v1 h1 v-2 h1 v2 h1 v0 h1 v7 h1 v-6 h1 v-3 h1 v-4 h1 v0 h1 v-2 h1 v-3 h1 v1 h1 v0 h1 v-12 h1 v5 h1 v3 h1 v2 h1 v-18 h1 v-2 h1 v-3 h1 v-1 h1 v-4 h1 v-10 h1 v-1 h1 v-8 h1 v5 h1 v-16 h1 v7 h1 v-7 h1 v21 h1 v6 h1 v-11 h1 v0 h1 v8 h1 v-14 h1 v24 h1 v15 h1 v-3 h1 v-2 h1 v-5 h1 v-3 h1 v-5 h1 v5 h1 v-3 h1 v-2 h1 v3 h1 v3 h1 v-3 h1 v-1 h1 v-1 h1 v-8 h1 v0 h1 v102Z"
            transform="scale(0.317076923076923 0.327142857142857)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >SC</text>
        </g>
        <g
          id="Oklahoma-bars"
          transform="translate(131.31 263.38)"
        >
          <path
            id="Oklahoma-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v-1 h1 v-5 h1 v2 h1 v6 h1 v1 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v-2 h1 v2 h1 v0 h1 v0 h1 v-4 h1 v-7 h1 v-4 h1 v-19 h1 v-13 h1 v-9 h1 v-2 h1 v0 h1 v-4 h1 v-3 h1 v-7 h1 v0 h1 v-1 h1 v-3 h1 v-3 h1 v-3 h1 v2 h1 v-7 h1 v-9 h1 v2 h1 v0 h1 v-7 h1 v-1 h1 v0 h1 v3 h1 v-10 h1 v-4 h1 v-7 h1 v5 h1 v8 h1 v-2 h1 v-6 h1 v-4 h1 v5 h1 v-3 h1 v-7 h1 v16 h1 v4 h1 v3 h1 v-4 h1 v-1 h1 v2 h1 v4 h1 v-4 h1 v-15 h1 v0 h1 v1 h1 v11 h1 v3 h1 v-2 h1 v-2 h1 v-1 h1 v1 h1 v-3 h1 v-7 h1 v1 h1 v6 h1 v-7 h1 v-4 h1 v19 h1 v2 h1 v-4 h1 v-7 h1 v0 h1 v-3 h1 v-3 h1 v-3 h1 v-1 h1 v1 h1 v-2 h1 v1 h1 v-1 h1 v-2 h1 v1 h1 v0 h1 v-1 h1 v2 h1 v1 h1 v0 h1 v-4 h1 v-1 h1 v-4 h1 v-5 h1 v0 h1 v-1 h1 v146Z"
            transform="scale(0.317076923076923 0.282328767123288)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >OK</text>
        </g>
        <g
          id="Louisiana-bars"
          transform="translate(175.08 263.38)"
        >
          <path
            id="Louisiana-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v3 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v1 h1 v2 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-3 h1 v-1 h1 v-13 h1 v-7 h1 v-7 h1 v0 h1 v-8 h1 v-4 h1 v-3 h1 v-2 h1 v-1 h1 v0 h1 v-7 h1 v-7 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v-1 h1 v-11 h1 v-6 h1 v2 h1 v-2 h1 v-1 h1 v-11 h1 v0 h1 v-1 h1 v-1 h1 v5 h1 v2 h1 v8 h1 v1 h1 v15 h1 v-4 h1 v9 h1 v0 h1 v-3 h1 v3 h1 v-3 h1 v2 h1 v0 h1 v2 h1 v-2 h1 v1 h1 v-8 h1 v2 h1 v4 h1 v-1 h1 v8 h1 v3 h1 v5 h1 v-1 h1 v2 h1 v-2 h1 v2 h1 v1 h1 v9 h1 v-3 h1 v-4 h1 v7 h1 v-4 h1 v-1 h1 v-4 h1 v-1 h1 v0 h1 v-4 h1 v-7 h1 v-1 h1 v1 h1 v6 h1 v1 h1 v1 h1 v0 h1 v-3 h1 v-2 h1 v-4 h1 v2 h1 v1 h1 v1 h1 v11 h1 v-1 h1 v-5 h1 v3 h1 v50Z"
            transform="scale(0.317076923076923 0.4122)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >LA</text>
        </g>
        <g
          id="Mississippi-bars"
          transform="translate(218.85 263.38)"
        >
          <path
            id="Mississippi-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v-1 h1 v1 h1 v5 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-12 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v-3 h1 v-4 h1 v-16 h1 v-15 h1 v1 h1 v-3 h1 v8 h1 v-5 h1 v-6 h1 v-1 h1 v5 h1 v-1 h1 v1 h1 v1 h1 v-1 h1 v-2 h1 v-1 h1 v2 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v1 h1 v1 h1 v-3 h1 v-5 h1 v0 h1 v-2 h1 v-1 h1 v-5 h1 v-2 h1 v3 h1 v6 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v-3 h1 v-5 h1 v-5 h1 v1 h1 v1 h1 v0 h1 v0 h1 v7 h1 v0 h1 v3 h1 v-1 h1 v-2 h1 v-4 h1 v-2 h1 v-4 h1 v4 h1 v8 h1 v-10 h1 v0 h1 v-3 h1 v-3 h1 v4 h1 v-4 h1 v-7 h1 v0 h1 v-4 h1 v-6 h1 v1 h1 v4 h1 v-1 h1 v7 h1 v7 h1 v1 h1 v-2 h1 v-1 h1 v-1 h1 v5 h1 v-2 h1 v8 h1 v-1 h1 v1 h1 v2 h1 v3 h1 v-1 h1 v-10 h1 v2 h1 v75Z"
            transform="scale(0.317076923076923 0.424948453608247)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >MS</text>
        </g>
        <g
          id="Alabama-bars"
          transform="translate(262.62 263.38)"
        >
          <path
            id="Alabama-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v3 h1 v0 h1 v1 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v-7 h1 v-2 h1 v-1 h1 v5 h1 v-3 h1 v2 h1 v-12 h1 v-4 h1 v-4 h1 v8 h1 v-2 h1 v-1 h1 v0 h1 v-7 h1 v0 h1 v-7 h1 v-12 h1 v-16 h1 v1 h1 v-3 h1 v0 h1 v-6 h1 v-7 h1 v-2 h1 v1 h1 v0 h1 v0 h1 v1 h1 v2 h1 v-3 h1 v-11 h1 v1 h1 v0 h1 v1 h1 v-11 h1 v-3 h1 v-5 h1 v-10 h1 v3 h1 v0 h1 v-1 h1 v-3 h1 v2 h1 v10 h1 v1 h1 v11 h1 v4 h1 v3 h1 v21 h1 v14 h1 v0 h1 v2 h1 v-11 h1 v-11 h1 v-12 h1 v4 h1 v-6 h1 v6 h1 v-7 h1 v11 h1 v2 h1 v2 h1 v1 h1 v1 h1 v-3 h1 v-4 h1 v-10 h1 v-1 h1 v-9 h1 v8 h1 v-4 h1 v-2 h1 v2 h1 v-4 h1 v-5 h1 v0 h1 v-9 h1 v-2 h1 v-1 h1 v-2 h1 v-6 h1 v4 h1 v-1 h1 v-1 h1 v9 h1 v-1 h1 v-3 h1 v-3 h1 v-3 h1 v4 h1 v0 h1 v3 h1 v-4 h1 v-1 h1 v0 h1 v-12 h1 v1 h1 v133Z"
            transform="scale(0.317076923076923 0.307611940298507)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >AL</text>
        </g>
        <g
          id="Georgia-bars"
          transform="translate(306.39 263.38)"
        >
          <path
            id="Georgia-counts"
            class="state-trend"
            d="M0,0 v-1 h1 v0 h1 v1 h1 v0 h1 v-2 h1 v0 h1 v-1 h1 v-5 h1 v-3 h1 v-1 h1 v-1 h1 v-1 h1 v-4 h1 v3 h1 v-3 h1 v-7 h1 v1 h1 v0 h1 v1 h1 v4 h1 v2 h1 v0 h1 v-2 h1 v5 h1 v-1 h1 v0 h1 v2 h1 v-2 h1 v0 h1 v-2 h1 v-2 h1 v6 h1 v3 h1 v1 h1 v1 h1 v0 h1 v-3 h1 v-1 h1 v-1 h1 v-13 h1 v-10 h1 v-2 h1 v15 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-5 h1 v-32 h1 v-6 h1 v-13 h1 v-7 h1 v0 h1 v-12 h1 v-6 h1 v-6 h1 v3 h1 v1 h1 v4 h1 v0 h1 v5 h1 v3 h1 v-4 h1 v1 h1 v-3 h1 v-6 h1 v3 h1 v-7 h1 v-2 h1 v-6 h1 v-1 h1 v-3 h1 v-2 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v12 h1 v8 h1 v18 h1 v0 h1 v2 h1 v-1 h1 v-4 h1 v1 h1 v-3 h1 v2 h1 v-2 h1 v-4 h1 v0 h1 v2 h1 v-1 h1 v-3 h1 v2 h1 v-8 h1 v-1 h1 v-5 h1 v0 h1 v2 h1 v2 h1 v1 h1 v-5 h1 v-3 h1 v-7 h1 v4 h1 v8 h1 v-8 h1 v0 h1 v-3 h1 v-20 h1 v-6 h1 v-17 h1 v1 h1 v-24 h1 v9 h1 v-19 h1 v-17 h1 v-20 h1 v-39 h1 v3 h1 v-5 h1 v5 h1 v-19 h1 v5 h1 v-1 h1 v-5 h1 v5 h1 v289Z"
            transform="scale(0.317076923076923 0.140204081632653)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >GA</text>
        </g>
        <g
          id="Texas-bars"
          transform="translate(131.31 307.15)"
        >
          <path
            id="Texas-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v0 h1 v-1 h1 v3 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-14 h1 v-7 h1 v-2 h1 v0 h1 v4 h1 v-3 h1 v-2 h1 v-7 h1 v-16 h1 v-52 h1 v17 h1 v1 h1 v6 h1 v1 h1 v4 h1 v-10 h1 v-1 h1 v-5 h1 v6 h1 v3 h1 v1 h1 v-2 h1 v-1 h1 v-13 h1 v-60 h1 v3 h1 v-4 h1 v-7 h1 v-5 h1 v-4 h1 v-2 h1 v-3 h1 v-17 h1 v0 h1 v-3 h1 v-2 h1 v-1 h1 v-18 h1 v-2 h1 v3 h1 v-2 h1 v-8 h1 v4 h1 v-11 h1 v-9 h1 v-22 h1 v-11 h1 v-27 h1 v-26 h1 v-13 h1 v-10 h1 v-7 h1 v-22 h1 v-25 h1 v-14 h1 v-11 h1 v-4 h1 v2 h1 v14 h1 v-9 h1 v-4 h1 v19 h1 v6 h1 v-6 h1 v11 h1 v14 h1 v9 h1 v4 h1 v7 h1 v-7 h1 v17 h1 v23 h1 v9 h1 v2 h1 v19 h1 v3 h1 v11 h1 v9 h1 v2 h1 v-4 h1 v18 h1 v-10 h1 v-18 h1 v-5 h1 v0 h1 v-5 h1 v-35 h1 v-21 h1 v-1 h1 v-5 h1 v-4 h1 v-8 h1 v-28 h1 v-13 h1 v-7 h1 v-10 h1 v-3 h1 v-3 h1 v-6 h1 v-8 h1 v-21 h1 v-10 h1 v-21 h1 v-1 h1 v514Z"
            transform="scale(0.317076923076923 0.0801945525291829)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >TX</text>
        </g>
        <g
          id="Florida-bars"
          transform="translate(350.16 307.15)"
        >
          <path
            id="Florida-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-3 h1 v-4 h1 v-1 h1 v0 h1 v-10 h1 v-8 h1 v-5 h1 v-2 h1 v-1 h1 v-3 h1 v-2 h1 v1 h1 v-4 h1 v-14 h1 v-5 h1 v0 h1 v-4 h1 v-3 h1 v0 h1 v-2 h1 v-13 h1 v-3 h1 v-1 h1 v-3 h1 v-16 h1 v-4 h1 v2 h1 v-2 h1 v0 h1 v-9 h1 v-5 h1 v-17 h1 v-5 h1 v-6 h1 v-4 h1 v0 h1 v-3 h1 v-21 h1 v-18 h1 v4 h1 v-10 h1 v11 h1 v2 h1 v3 h1 v-12 h1 v7 h1 v-3 h1 v-10 h1 v-7 h1 v-1 h1 v-12 h1 v-7 h1 v-2 h1 v-1 h1 v-13 h1 v-1 h1 v5 h1 v-6 h1 v-10 h1 v-6 h1 v-14 h1 v-22 h1 v-1 h1 v14 h1 v3 h1 v4 h1 v-4 h1 v-5 h1 v12 h1 v-30 h1 v-11 h1 v-6 h1 v5 h1 v-25 h1 v-14 h1 v1 h1 v-2 h1 v-19 h1 v8 h1 v-36 h1 v-5 h1 v-32 h1 v-3 h1 v31 h1 v4 h1 v18 h1 v1 h1 v12 h1 v-3 h1 v-22 h1 v10 h1 v2 h1 v-4 h1 v402Z"
            transform="scale(0.317076923076923 0.0913968957871397)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >FL</text>
        </g>
        <g
          id="Alaska-bars"
          transform="translate(0 350.92)"
        >
          <path
            id="Alaska-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v-2 h1 v0 h1 v-9 h1 v-4 h1 v0 h1 v0 h1 v1 h1 v1 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v5 h1 v-1 h1 v-3 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v3 h1 v2 h1 v0 h1 v1 h1 v0 h1 v1 h1 v2 h1 v0 h1 v1 h1 v1 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-7 h1 v-13 h1 v-5 h1 v-17 h1 v-3 h1 v-13 h1 v3 h1 v-2 h1 v3 h1 v-4 h1 v2 h1 v-3 h1 v-1 h1 v-4 h1 v-6 h1 v0 h1 v-8 h1 v-11 h1 v-2 h1 v-17 h1 v-3 h1 v-2 h1 v-1 h1 v3 h1 v-6 h1 v-1 h1 v3 h1 v16 h1 v-2 h1 v2 h1 v-1 h1 v-8 h1 v8 h1 v-3 h1 v-4 h1 v9 h1 v2 h1 v-2 h1 v5 h1 v14 h1 v10 h1 v2 h1 v2 h1 v-6 h1 v0 h1 v-16 h1 v9 h1 v13 h1 v3 h1 v4 h1 v2 h1 v-13 h1 v-13 h1 v-9 h1 v1 h1 v-7 h1 v-3 h1 v8 h1 v-3 h1 v3 h1 v3 h1 v0 h1 v-2 h1 v-6 h1 v-7 h1 v0 h1 v11 h1 v-1 h1 v4 h1 v9 h1 v0 h1 v-1 h1 v-2 h1 v87Z"
            transform="scale(0.317076923076923 0.340661157024793)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >AK</text>
        </g>
        <g
          id="Hawaii-bars"
          transform="translate(43.77 350.92)"
        >
          <path
            id="Hawaii-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v-2 h1 v-9 h1 v-17 h1 v-7 h1 v-14 h1 v-12 h1 v12 h1 v7 h1 v6 h1 v-10 h1 v-10 h1 v1 h1 v-3 h1 v-9 h1 v0 h1 v9 h1 v-10 h1 v-2 h1 v-3 h1 v0 h1 v5 h1 v-5 h1 v-5 h1 v-22 h1 v4 h1 v7 h1 v1 h1 v-4 h1 v-9 h1 v-2 h1 v-9 h1 v-5 h1 v-2 h1 v3 h1 v0 h1 v0 h1 v0 h1 v6 h1 v-2 h1 v-2 h1 v1 h1 v-3 h1 v0 h1 v-6 h1 v-7 h1 v0 h1 v2 h1 v2 h1 v6 h1 v-12 h1 v0 h1 v-10 h1 v6 h1 v-5 h1 v-17 h1 v-14 h1 v-1 h1 v3 h1 v-12 h1 v15 h1 v4 h1 v12 h1 v20 h1 v20 h1 v3 h1 v-2 h1 v-2 h1 v1 h1 v1 h1 v2 h1 v8 h1 v-3 h1 v1 h1 v10 h1 v-1 h1 v-2 h1 v13 h1 v0 h1 v3 h1 v-2 h1 v1 h1 v-1 h1 v-2 h1 v-1 h1 v-1 h1 v-3 h1 v7 h1 v5 h1 v5 h1 v0 h1 v1 h1 v1 h1 v-4 h1 v5 h1 v4 h1 v6 h1 v5 h1 v-1 h1 v-2 h1 v2 h1 v-2 h1 v4 h1 v3 h1 v-5 h1 v-3 h1 v3 h1 v-1 h1 v-5 h1 v0 h1 v-3 h1 v65Z"
            transform="scale(0.317076923076923 0.224021739130435)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >HI</text>
        </g>
        <g
          id="Puerto Rico-bars"
          transform="translate(437.7 350.92)"
        >
          <path
            id="Puerto Rico-counts"
            class="state-trend"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v-1 h1 v1 h1 v-4 h1 v0 h1 v1 h1 v2 h1 v2 h1 v1 h1 v0 h1 v-1 h1 v2 h1 v1 h1 v-3 h1 v-9 h1 v-5 h1 v1 h1 v-1 h1 v-3 h1 v-1 h1 v-5 h1 v-4 h1 v1 h1 v-19 h1 v16 h1 v-3 h1 v-2 h1 v5 h1 v3 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v-2 h1 v1 h1 v-1 h1 v-5 h1 v1 h1 v0 h1 v-4 h1 v-7 h1 v-2 h1 v-9 h1 v-7 h1 v-6 h1 v4 h1 v0 h1 v0 h1 v2 h1 v-3 h1 v2 h1 v-2 h1 v-7 h1 v-3 h1 v3 h1 v-1 h1 v-2 h1 v-3 h1 v6 h1 v-1 h1 v3 h1 v-1 h1 v3 h1 v1 h1 v-2 h1 v2 h1 v-1 h1 v3 h1 v-15 h1 v0 h1 v-5 h1 v94Z"
            transform="scale(0.317076923076923 0.438510638297872)"
          />
          <text
            class="state-label"
            y="0"
            x="41.22"
          >PR</text>
        </g>
        <rect
          id="tooltip_bg"
          height="32"
          class="hidden"
        />
        <g
          id="tool_pt"
          class="hidden"
        >
          <defs>
            <clipPath
              id="tip-clip"
            >
              <rect
                x="-8"
                width="16"
                y="-9.5"
                height="11"
              />
            </clipPath>
          </defs>
          <path
            d="M-6,-10 l6,10 l6,-10"
            class="tooltip-box"
            clip-path="url(#tip-clip)"
          />
        </g>
        <text
          id="tooltip"
          stroke="none"
          dy="-15"
          fill="#000000"
          text-anchor="middle"
          class="sub-label"
        />
        <g
          id="Maine-hovers"
          transform="translate(459.585 0.76)"
        >
          <rect
            id="Maine-mouse"
            x="0"
            y="-64"
            width="130"
            height="64"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.6440625)"
            data="{&quot;n_gages&quot;:[0,1,1,1,2,2,3,3,3,3,3,3,4,10,11,13,15,13,15,15,18,19,18,19,18,18,17,19,19,19,20,22,21,21,20,22,22,23,24,27,33,35,38,38,38,38,37,37,37,39,41,43,46,46,46,46,46,47,47,47,48,49,50,51,51,51,51,51,52,50,51,51,51,51,52,57,57,57,57,57,55,55,55,55,55,55,57,59,60,63,56,59,61,50,45,41,41,41,42,44,45,45,42,41,40,40,40,38,39,42,50,52,55,54,55,56,56,51,53,59,63,64,64,62,61,62,61,61,61,61],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Vermont-hovers"
          transform="translate(415.815 44.53)"
        >
          <rect
            id="Vermont-mouse"
            x="0"
            y="-55"
            width="130"
            height="55"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.749454545454545)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,3,4,5,9,8,8,9,7,8,7,9,4,3,3,3,2,16,19,20,22,22,23,23,23,23,24,25,28,34,34,34,34,35,33,34,35,36,36,36,36,36,36,36,35,35,35,36,36,36,36,36,47,47,47,47,47,47,47,47,47,47,45,36,35,37,35,35,34,34,38,32,30,31,31,32,32,32,28,39,36,35,35,36,37,37,38,38,39,39,41,41,41,44,46,44,44,44,49,55,45,46,45,44,44,45,46,47],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="New Hampshire-hovers"
          transform="translate(459.585 44.53)"
        >
          <rect
            id="New Hampshire-mouse"
            x="0"
            y="-61"
            width="130"
            height="61"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.675737704918033)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,1,1,1,3,3,5,6,7,7,7,7,6,6,7,8,7,7,9,12,14,14,13,13,15,16,16,16,17,20,24,25,24,24,25,26,28,28,30,31,38,42,43,45,45,45,49,49,49,49,49,48,48,47,47,47,47,48,47,48,48,48,48,51,56,60,60,60,60,61,61,57,57,58,56,56,56,53,48,42,43,39,39,40,39,38,37,39,39,40,34,32,32,33,35,38,37,37,37,37,37,38,45,46,50,38,39,41,37,44,52,48,48,48,48,49,52,52,53,53],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Washington-hovers"
          transform="translate(0 88.3)"
        >
          <rect
            id="Washington-mouse"
            x="0"
            y="-340"
            width="130"
            height="340"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.121235294117647)"
            data="{&quot;n_gages&quot;:[0,0,1,1,1,1,2,2,4,7,6,7,4,6,11,12,13,10,19,29,43,59,69,54,70,66,48,58,57,60,63,61,61,54,53,58,58,53,64,86,122,118,107,98,97,103,105,108,113,113,123,123,131,137,155,175,220,247,254,253,253,237,243,252,252,249,254,258,266,267,273,295,305,311,330,340,329,328,336,322,306,286,252,239,226,231,227,237,224,211,197,196,182,188,185,200,199,187,194,192,179,187,188,194,206,206,201,211,214,209,212,213,222,229,221,218,222,230,232,234,229,235,238,238,239,243,239,241,244,250],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Idaho-hovers"
          transform="translate(43.77 88.3)"
        >
          <rect
            id="Idaho-mouse"
            x="0"
            y="-208"
            width="130"
            height="208"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.198173076923077)"
            data="{&quot;n_gages&quot;:[0,2,1,1,0,0,4,1,1,4,1,3,3,3,6,6,7,5,8,9,18,39,59,56,58,42,43,33,36,39,58,68,84,77,78,80,85,87,83,99,106,113,127,120,118,120,124,128,141,144,165,170,164,169,170,181,186,198,194,190,181,186,188,172,175,176,188,185,186,191,182,181,183,178,178,182,184,188,192,191,183,181,166,163,156,152,154,160,153,155,161,162,153,140,141,149,202,186,180,180,176,171,176,173,172,167,167,164,160,169,169,174,178,183,181,182,182,173,173,171,173,181,194,189,185,188,194,193,208,204],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Montana-hovers"
          transform="translate(87.54 88.3)"
        >
          <rect
            id="Montana-mouse"
            x="0"
            y="-202"
            width="130"
            height="202"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.204059405940594)"
            data="{&quot;n_gages&quot;:[4,5,6,5,5,5,6,6,8,9,12,11,10,15,19,19,20,21,35,44,60,68,59,53,59,47,51,45,48,52,52,56,64,71,60,47,45,43,39,59,67,75,79,51,46,77,91,90,89,101,116,115,125,111,111,112,128,153,165,175,173,179,202,198,139,138,147,143,150,152,160,167,167,170,164,169,172,167,162,164,147,145,140,148,148,153,161,159,162,170,171,172,172,190,196,192,171,163,156,156,156,155,155,140,140,147,140,133,137,137,142,150,157,156,161,153,156,141,149,152,151,148,144,156,153,160,164,160,157,162],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="North Dakota-hovers"
          transform="translate(131.31 88.3)"
        >
          <rect
            id="North Dakota-mouse"
            x="0"
            y="-132"
            width="130"
            height="132"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.312272727272727)"
            data="{&quot;n_gages&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,2,2,8,10,9,7,8,6,7,7,7,7,7,7,5,6,5,5,6,6,7,6,7,5,5,5,5,11,14,16,18,15,13,15,16,17,23,27,30,31,31,31,39,42,51,55,55,57,63,67,67,68,69,72,75,87,94,94,97,98,101,102,100,103,109,111,111,110,110,106,108,106,107,110,105,106,124,132,129,130,103,82,78,75,76,76,76,78,78,75,76,80,84,78,74,74,73,72,73,74,78,78,76,76,76,76,75,78,80,82,81,83,81,82,78,77,78,80],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Minnesota-hovers"
          transform="translate(175.08 88.3)"
        >
          <rect
            id="Minnesota-mouse"
            x="0"
            y="-121"
            width="130"
            height="121"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.340661157024793)"
            data="{&quot;n_gages&quot;:[1,1,1,1,1,2,1,2,1,1,1,2,3,3,4,5,5,5,5,6,19,21,30,30,27,23,27,25,6,7,6,9,8,9,12,11,11,11,11,23,29,38,41,39,42,50,55,54,53,52,65,71,73,84,84,90,94,98,93,95,101,100,102,109,116,112,107,104,104,101,104,107,100,91,94,89,95,98,106,115,114,107,105,110,111,109,116,121,120,107,101,94,82,89,84,81,83,80,82,88,81,77,82,83,80,78,83,85,86,84,83,81,87,93,92,97,98,97,100,97,93,94,103,100,103,108,105,104,104,106],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Wisconsin-hovers"
          transform="translate(218.85 88.3)"
        >
          <rect
            id="Wisconsin-mouse"
            x="0"
            y="-198"
            width="130"
            height="198"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.208181818181818)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,1,1,1,1,3,5,3,5,6,9,3,4,4,6,9,16,46,46,46,46,48,46,47,44,43,43,45,42,43,42,46,45,48,48,49,50,56,58,59,60,63,71,71,72,79,79,92,91,94,93,97,97,99,96,97,96,92,87,87,88,88,90,91,84,84,92,98,95,98,98,106,102,97,104,111,106,107,119,135,130,136,121,117,99,101,100,102,100,99,103,116,120,114,121,122,132,133,117,121,125,143,149,142,147,156,163,179,185,173,177,172,173,184,187,197,193,194,190,190,198,198],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Michigan-hovers"
          transform="translate(284.505 88.3)"
        >
          <rect
            id="Michigan-mouse"
            x="0"
            y="-215"
            width="130"
            height="215"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.191720930232558)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,6,5,3,2,2,5,5,5,5,6,8,5,7,7,7,5,5,5,5,5,6,6,6,7,7,8,19,19,24,23,30,33,31,36,48,52,53,46,68,69,82,91,95,102,114,115,127,137,147,147,155,156,156,155,162,170,175,182,188,186,195,205,212,215,212,213,208,206,201,198,202,199,199,191,188,190,181,166,145,139,136,137,136,143,147,145,146,143,144,137,142,138,140,140,142,144,149,159,166,160,170,162,158,156,156,154,153,142,150,145,159,164,161,160,162],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="New York-hovers"
          transform="translate(372.045 88.3)"
        >
          <rect
            id="New York-mouse"
            x="0"
            y="-295"
            width="130"
            height="295"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.139728813559322)"
            data="{&quot;n_gages&quot;:[2,2,2,2,2,2,3,3,3,4,5,6,10,11,13,13,17,14,24,25,23,23,27,31,31,33,39,39,39,39,42,49,49,50,55,69,73,77,82,87,89,96,97,89,95,98,100,101,129,148,151,162,163,165,168,180,185,189,191,192,196,201,205,207,207,209,217,217,225,233,239,255,254,245,240,256,258,257,264,193,189,185,188,191,191,196,197,193,192,194,197,199,192,190,184,186,186,185,182,180,172,190,203,204,212,198,193,195,212,218,212,220,227,230,233,232,240,241,241,232,238,231,236,239,233,248,258,264,280,295],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Massachusetts-hovers"
          transform="translate(415.815 88.3)"
        >
          <rect
            id="Massachusetts-mouse"
            x="0"
            y="-115"
            width="130"
            height="115"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.358434782608696)"
            data="{&quot;n_gages&quot;:[0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,2,3,3,6,9,10,11,16,14,15,15,16,16,16,18,18,18,18,18,20,21,22,26,26,26,26,28,30,33,34,42,46,47,47,47,47,49,52,52,53,56,56,54,55,56,56,56,56,56,60,61,58,61,66,71,72,74,83,82,82,83,86,83,87,87,81,81,81,83,77,77,76,76,71,69,73,73,70,70,69,67,61,59,60,60,65,69,67,74,71,77,73,75,82,83,86,87,102,113,115,93,95,98,99,100,104,106,100,101,101],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Rhode Island-hovers"
          transform="translate(459.585 88.3)"
        >
          <rect
            id="Rhode Island-mouse"
            x="0"
            y="-37"
            width="130"
            height="37"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 1.11405405405405)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,6,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,13,10,10,12,12,12,15,20,20,20,20,20,20,20,19,21,15,18,18,18,16,16,16,14,15,15,15,15,16,16,16,16,16,15,15,16,18,18,18,18,19,22,22,20,28,29,25,20,21,26,37,35,35,35,35,35,31,31,30,31,31],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Oregon-hovers"
          transform="translate(0 132.07)"
        >
          <rect
            id="Oregon-mouse"
            x="0"
            y="-317"
            width="130"
            height="317"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.130031545741325)"
            data="{&quot;n_gages&quot;:[1,2,1,1,2,1,4,2,4,4,2,2,2,2,10,14,26,25,29,32,40,50,49,52,56,48,42,38,44,41,46,47,52,56,64,81,89,102,102,116,128,132,137,134,143,144,158,160,170,181,192,210,213,216,214,217,216,226,230,234,244,247,248,244,238,240,244,246,246,248,249,267,270,272,286,285,295,308,317,310,310,302,298,303,292,292,313,304,304,310,303,304,280,282,278,277,273,270,256,253,249,239,185,188,192,185,183,186,180,183,185,184,189,199,208,202,205,199,206,195,197,197,201,201,199,203,201,200,205,206],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Nevada-hovers"
          transform="translate(43.77 132.07)"
        >
          <rect
            id="Nevada-mouse"
            x="0"
            y="-144"
            width="130"
            height="144"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.28625)"
            data="{&quot;n_gages&quot;:[0,1,1,1,0,1,2,4,3,4,5,6,7,8,8,6,8,8,5,6,3,4,12,13,24,26,27,23,22,22,22,25,31,24,20,15,18,16,14,13,13,15,14,12,11,10,12,14,13,13,17,17,14,15,21,25,30,35,38,47,47,48,51,50,50,49,46,46,49,49,51,54,59,62,70,72,80,88,90,87,88,88,87,83,80,82,85,90,100,100,101,101,88,79,77,83,84,82,80,93,106,120,132,139,144,143,127,123,123,119,120,118,120,132,139,125,132,137,136,131,128,129,133,131,131,143,136,135,136,137],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Wyoming-hovers"
          transform="translate(87.54 132.07)"
        >
          <rect
            id="Wyoming-mouse"
            x="0"
            y="-201"
            width="130"
            height="201"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.205074626865672)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,1,2,3,3,2,1,1,4,6,10,9,5,4,4,3,11,20,15,23,32,49,49,45,48,50,53,58,56,54,35,35,34,29,39,47,58,57,52,54,55,57,58,63,93,100,104,112,115,115,118,132,153,156,164,181,188,194,198,182,183,183,191,189,186,190,185,194,199,191,188,193,201,194,181,174,170,126,126,123,136,155,151,162,162,157,154,131,135,132,113,121,116,120,128,126,132,138,122,115,118,110,95,87,84,86,90,94,96,103,109,99,99,98,97,96,98,100,98,97,103,100,98,92,95],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="South Dakota-hovers"
          transform="translate(131.31 132.07)"
        >
          <rect
            id="South Dakota-mouse"
            x="0"
            y="-135"
            width="130"
            height="135"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.305333333333333)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,5,7,7,5,5,6,10,10,10,11,18,20,15,16,17,25,24,46,47,50,55,59,68,68,68,71,73,78,78,78,76,82,83,86,93,93,93,97,100,100,103,97,96,100,92,92,91,94,99,97,101,100,95,97,104,101,108,106,103,121,135,125,124,126,126,126,122,117,118,112,105,109,112,112,105,104,105,103,103,106,104,103,103,103,102,102,104,105,106,105,103],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Iowa-hovers"
          transform="translate(175.08 132.07)"
        >
          <rect
            id="Iowa-mouse"
            x="0"
            y="-149"
            width="130"
            height="149"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.276644295302013)"
            data="{&quot;n_gages&quot;:[2,2,2,2,2,2,2,2,2,2,2,2,2,4,5,6,5,4,4,4,4,4,6,6,9,13,15,14,15,19,22,26,26,27,27,23,23,23,16,19,20,20,18,24,30,34,34,39,40,43,48,60,60,58,58,57,67,69,70,75,78,79,79,86,86,89,93,97,100,107,109,111,111,113,116,116,119,120,121,121,115,115,119,121,114,108,111,110,120,120,118,113,111,107,106,107,111,113,113,114,114,116,114,116,115,117,115,114,113,110,111,117,123,125,128,127,122,124,127,123,126,137,140,146,146,149,140,143,138,138],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Illinois-hovers"
          transform="translate(218.85 132.07)"
        >
          <rect
            id="Illinois-mouse"
            x="0"
            y="-193"
            width="130"
            height="193"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.213575129533679)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,0,1,1,10,16,18,17,1,1,19,24,24,25,24,24,23,26,26,26,28,30,29,29,33,34,35,37,37,32,39,40,45,42,45,78,93,95,99,101,113,118,118,116,131,143,152,159,162,162,165,165,163,165,150,155,156,159,157,156,157,161,163,170,173,176,180,163,168,170,171,165,165,165,173,172,176,169,147,147,147,145,141,141,147,155,154,158,154,153,156,156,154,154,154,157,160,160,165,162,164,166,168,174,173,180,184,187,191,192,188,187,183,193,185],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Indiana-hovers"
          transform="translate(262.62 132.07)"
        >
          <rect
            id="Indiana-mouse"
            x="0"
            y="-199"
            width="130"
            height="199"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.20713567839196)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,1,1,1,1,1,1,3,2,1,1,1,1,1,1,8,9,12,10,14,18,20,24,31,32,32,33,33,34,34,34,42,46,49,51,63,67,70,75,79,93,100,101,99,104,104,107,116,118,126,129,134,138,142,143,145,152,154,160,165,178,189,199,191,187,177,177,178,174,173,172,175,184,177,167,169,167,170,171,170,169,177,178,170,170,161,160,159,160,158,159,160,157,148,145,121,124,123,128,140,143,149,155,159,166,156,153,173,177,181,181],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Ohio-hovers"
          transform="translate(306.39 132.07)"
        >
          <rect
            id="Ohio-mouse"
            x="0"
            y="-228"
            width="130"
            height="228"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.180789473684211)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,2,0,0,0,0,0,0,0,0,1,5,17,20,16,15,16,16,39,41,54,61,76,86,91,90,93,95,100,90,89,89,47,47,52,75,103,111,121,130,135,136,143,158,152,148,146,148,140,147,143,146,146,145,147,141,141,146,145,147,150,153,163,165,168,172,171,174,170,171,175,163,159,162,164,168,162,166,135,131,130,128,123,122,129,134,129,130,123,123,120,118,121,122,122,116,118,119,135,133,135,131,135,138,147,145,162,155,163,180,179,189,202,204,226,228],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Pennsylvania-hovers"
          transform="translate(350.16 132.07)"
        >
          <rect
            id="Pennsylvania-mouse"
            x="0"
            y="-277"
            width="130"
            height="277"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.148808664259928)"
            data="{&quot;n_gages&quot;:[3,4,4,4,4,4,5,5,5,5,6,6,7,8,8,10,11,11,12,19,25,30,37,39,42,52,49,51,49,49,60,63,64,64,62,61,64,65,68,68,76,77,85,88,90,91,92,91,97,107,120,138,149,149,155,158,158,157,160,170,171,170,171,169,166,171,172,173,176,170,170,178,184,188,196,209,227,233,241,244,246,245,248,253,259,270,273,268,270,250,247,228,229,228,229,236,235,240,242,241,238,236,228,232,231,219,208,211,215,206,210,208,212,216,216,221,229,228,236,246,242,252,254,266,271,273,277,267,265,275],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="New Jersey-hovers"
          transform="translate(393.93 132.07)"
        >
          <rect
            id="New Jersey-mouse"
            x="0"
            y="-129"
            width="130"
            height="129"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.31953488372093)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,2,2,2,2,2,3,10,10,9,6,6,4,4,4,2,4,5,4,4,4,4,5,8,8,24,30,35,35,37,36,38,40,40,42,45,50,52,58,59,60,65,63,67,67,68,69,69,71,71,71,70,71,70,70,69,72,74,76,74,74,77,73,74,75,74,73,74,74,75,77,79,82,82,83,80,86,85,83,82,77,91,93,94,97,97,100,99,93,94,93,91,86,83,86,86,95,95,93,88,87,85,83,86,86,85,88,99,104,102,105,105,113,111,119,125,129,121,114,112,112,112,115],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Connecticut-hovers"
          transform="translate(437.7 132.07)"
        >
          <rect
            id="Connecticut-mouse"
            x="0"
            y="-92"
            width="130"
            height="92"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.44804347826087)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,3,4,4,5,5,5,4,4,4,4,11,12,19,23,27,27,27,27,29,32,34,34,37,39,39,39,39,39,40,40,41,42,43,44,44,44,44,42,46,47,53,51,57,65,78,76,77,78,88,92,89,81,80,62,60,55,52,54,46,48,50,49,48,42,43,41,42,43,42,44,44,41,41,41,40,40,40,43,40,40,45,45,49,48,50,50,49,52,56,58,61,66,67,66,63,63,65,62,63,64,64],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="California-hovers"
          transform="translate(21.885 175.84)"
        >
          <rect
            id="California-mouse"
            x="0"
            y="-907"
            width="130"
            height="907"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.0454465270121279)"
            data="{&quot;n_gages&quot;:[0,0,2,2,4,3,8,8,8,9,11,11,17,21,26,33,39,43,50,48,56,82,140,155,125,125,110,129,133,133,135,149,174,185,194,198,211,212,238,265,300,332,324,308,309,299,302,311,300,307,348,365,366,371,389,396,401,419,436,449,463,496,526,545,556,569,574,603,658,710,740,782,804,809,833,844,872,883,875,888,890,907,901,894,872,883,884,878,874,832,824,823,776,745,720,724,705,735,741,755,795,802,783,755,777,742,756,745,761,788,803,826,818,813,828,792,801,831,833,824,843,826,842,824,840,835,815,790,811,792],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Utah-hovers"
          transform="translate(65.655 175.84)"
        >
          <rect
            id="Utah-mouse"
            x="0"
            y="-278"
            width="130"
            height="278"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.148273381294964)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,1,1,1,1,1,0,1,1,2,2,3,4,5,6,9,20,21,29,30,35,45,48,43,38,44,39,39,45,48,45,45,44,42,48,47,50,49,49,52,54,53,55,52,59,69,82,87,90,105,118,119,124,141,147,154,182,206,213,210,218,223,181,184,197,184,190,207,200,196,222,251,256,258,252,225,225,212,226,223,215,232,229,244,236,246,273,278,213,207,201,189,199,168,167,172,168,163,161,160,156,144,135,129,128,130,132,137,138,139,134,134,137,131,130,130,134,137,140,132,133,136,138,136,136,137],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Colorado-hovers"
          transform="translate(109.425 175.84)"
        >
          <rect
            id="Colorado-mouse"
            x="0"
            y="-430"
            width="130"
            height="430"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.0958604651162791)"
            data="{&quot;n_gages&quot;:[1,3,3,3,3,3,6,10,11,10,10,11,13,16,15,34,30,22,25,26,29,62,77,75,86,88,85,85,90,82,80,76,81,90,101,100,96,99,103,97,111,110,111,112,118,123,137,150,173,186,203,216,217,244,248,261,269,266,271,276,273,285,296,290,292,286,275,274,281,285,293,294,294,302,316,329,330,346,338,336,333,321,326,323,323,346,366,390,393,426,430,408,369,340,314,338,333,316,301,309,303,301,312,314,306,323,313,299,287,280,274,276,282,288,281,274,273,273,252,247,247,242,241,242,241,243,246,243,243,247],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Nebraska-hovers"
          transform="translate(153.195 175.84)"
        >
          <rect
            id="Nebraska-mouse"
            x="0"
            y="-169"
            width="130"
            height="169"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.243905325443787)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,2,1,0,0,0,0,0,0,0,0,1,1,1,1,2,10,15,22,32,35,35,40,43,44,52,55,56,70,77,72,76,80,86,97,105,119,138,146,157,165,157,165,169,159,161,154,158,158,165,166,166,158,153,155,156,163,149,149,147,142,142,144,139,138,147,155,152,151,146,153,153,152,153,151,154,151,154,153,127,125,114,86,82,91,92,85,85,85,87,94,93,89,91,92,93,92,90,94,92,92,93,98,98,101,110,109],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Missouri-hovers"
          transform="translate(196.965 175.84)"
        >
          <rect
            id="Missouri-mouse"
            x="0"
            y="-232"
            width="130"
            height="232"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.177672413793103)"
            data="{&quot;n_gages&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,1,1,1,1,1,1,1,1,1,2,2,2,3,3,3,4,25,39,43,47,50,51,55,63,67,67,69,73,71,74,77,79,78,81,85,85,82,81,82,83,87,87,88,105,108,113,112,112,113,116,123,126,130,133,130,134,134,139,139,141,153,159,157,159,155,152,145,132,132,132,122,115,112,113,114,117,106,103,104,100,99,99,101,105,102,96,93,93,98,100,102,108,125,129,137,148,169,170,172,172,179,181,203,207,205,206,210,212,220,222,226,230,232,232],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Kentucky-hovers"
          transform="translate(240.735 175.84)"
        >
          <rect
            id="Kentucky-mouse"
            x="0"
            y="-154"
            width="130"
            height="154"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.267662337662338)"
            data="{&quot;n_gages&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,2,4,13,11,10,7,7,7,7,8,8,10,14,14,15,24,28,32,8,12,12,12,12,14,18,45,60,73,79,79,78,82,82,83,82,85,87,88,92,96,99,106,108,113,118,118,118,122,117,116,117,119,118,119,124,131,131,132,125,124,123,127,113,110,108,103,105,108,105,103,93,88,90,87,90,93,104,107,106,89,94,76,76,81,91,95,110,107,118,126,124,120,116,116,122,122,127,133,132,140,143,144,140,145,150,154],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="West Virginia-hovers"
          transform="translate(284.505 175.84)"
        >
          <rect
            id="West Virginia-mouse"
            x="0"
            y="-119"
            width="130"
            height="119"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.346386554621849)"
            data="{&quot;n_gages&quot;:[1,1,1,1,1,1,4,4,4,4,5,4,3,5,6,5,3,3,7,16,21,22,22,22,22,23,39,21,13,13,13,12,14,15,19,23,23,18,20,34,48,52,42,43,43,44,43,45,52,61,63,75,77,77,80,83,90,97,98,97,97,95,93,89,89,88,90,92,92,89,90,89,88,90,87,92,91,96,99,102,105,104,107,107,105,117,114,119,105,107,106,103,100,72,63,62,72,74,70,74,73,73,73,70,62,59,56,65,65,63,63,66,66,68,68,67,66,66,67,68,73,73,76,82,82,83,84,84,86,84],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Maryland-hovers"
          transform="translate(328.275 175.84)"
        >
          <rect
            id="Maryland-mouse"
            x="0"
            y="-146"
            width="130"
            height="146"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.282328767123288)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,1,3,5,5,6,6,6,6,5,4,5,5,5,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,5,6,7,8,11,19,20,22,25,25,26,25,25,25,29,30,30,32,34,34,42,43,44,54,67,73,78,84,82,81,81,81,75,81,74,76,75,75,76,75,76,78,87,95,94,94,92,92,89,90,86,84,88,82,83,82,85,80,81,86,83,82,84,82,80,76,77,72,76,74,76,72,82,82,91,99,112,117,114,114,115,111,121,130,135,133,134,135,136,144,143,140,144,146,144],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Delaware-hovers"
          transform="translate(372.045 175.84)"
        >
          <rect
            id="Delaware-mouse"
            x="0"
            y="-23"
            width="130"
            height="23"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 1.79217391304348)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,1,1,1,0,0,0,0,0,0,0,7,7,7,9,9,9,9,9,11,12,12,12,12,13,11,13,13,14,14,15,16,16,16,16,16,15,16,16,16,16,16,16,16,16,16,19,18,15,13,12,12,12,12,13,13,12,13,14,15,17,17,15,14,15,16,20,15,21,22,22,23,16,15,15,20,15,15,15,16,19,17,17,17,16,18,18],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="District of Columbia-hovers"
          transform="translate(415.815 175.84)"
        >
          <rect
            id="District of Columbia-mouse"
            x="0"
            y="-4"
            width="130"
            height="4"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 10.305)"
            data="{&quot;n_gages&quot;:[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Arizona-hovers"
          transform="translate(65.655 219.61)"
        >
          <rect
            id="Arizona-mouse"
            x="0"
            y="-203"
            width="130"
            height="203"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.203054187192118)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,5,8,4,3,3,1,1,3,5,17,17,18,18,20,20,18,18,20,21,23,24,18,20,22,24,34,39,42,43,27,29,44,43,43,46,49,58,62,61,63,70,67,56,57,63,64,71,74,77,82,84,89,94,104,98,106,108,119,121,128,130,138,159,172,173,179,176,175,159,159,158,161,157,159,149,170,160,158,140,139,141,140,134,135,138,143,153,155,141,144,146,161,162,159,163,164,175,171,177,179,159,186,186,187,196,195,196,203,199,192,190,194,184,189,193],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="New Mexico-hovers"
          transform="translate(109.425 219.61)"
        >
          <rect
            id="New Mexico-mouse"
            x="0"
            y="-176"
            width="130"
            height="176"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.234204545454545)"
            data="{&quot;n_gages&quot;:[1,1,1,1,0,1,2,2,2,2,3,3,3,3,2,3,3,6,7,5,6,6,7,15,19,15,13,19,18,15,19,14,17,13,16,17,10,17,26,23,25,43,49,50,50,54,56,70,74,77,85,86,83,86,94,97,100,102,104,104,108,104,109,113,117,121,116,126,129,135,138,145,147,154,174,176,176,172,170,164,168,165,157,152,145,148,152,153,165,161,164,162,163,150,149,151,148,141,141,140,143,139,141,143,150,140,135,127,129,131,128,139,144,143,146,132,141,143,146,146,144,143,140,139,138,135,138,136,147,146],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Kansas-hovers"
          transform="translate(153.195 219.61)"
        >
          <rect
            id="Kansas-mouse"
            x="0"
            y="-183"
            width="130"
            height="183"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.225245901639344)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,6,5,5,6,6,6,6,10,7,8,3,0,0,0,0,0,0,0,1,0,0,0,6,11,17,17,22,31,31,26,26,24,26,33,45,45,37,36,36,40,41,43,38,50,60,60,60,64,64,67,72,79,82,83,87,93,96,97,90,100,101,101,101,104,117,117,126,137,144,152,151,155,159,158,159,152,149,146,148,147,148,149,147,152,156,155,147,141,140,142,138,134,134,136,135,135,135,143,148,150,153,148,152,146,146,144,145,151,155,157,154,147,147,148,157,153,159,163,161,172,177,182,183,183],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Arkansas-hovers"
          transform="translate(196.965 219.61)"
        >
          <rect
            id="Arkansas-mouse"
            x="0"
            y="-133"
            width="130"
            height="133"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.309924812030075)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,2,3,3,3,3,3,8,18,21,23,22,22,20,23,27,33,39,45,57,59,60,56,56,56,59,62,64,64,68,73,74,77,77,82,82,83,85,85,85,88,92,93,95,96,95,97,99,98,91,79,78,76,75,75,70,70,58,58,58,52,49,47,47,43,45,42,47,50,54,59,56,58,58,46,48,55,60,68,77,84,97,101,98,96,105,102,109,114,122,112,119,124,131,130,126,126,132,133],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Tennessee-hovers"
          transform="translate(240.735 219.61)"
        >
          <rect
            id="Tennessee-mouse"
            x="0"
            y="-151"
            width="130"
            height="151"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.272980132450331)"
            data="{&quot;n_gages&quot;:[1,1,1,2,2,2,2,2,2,2,3,7,6,6,11,14,13,13,11,9,9,9,11,13,13,13,13,11,11,13,22,33,35,40,40,40,51,51,56,57,69,75,76,92,80,94,96,98,99,100,105,112,113,113,113,117,120,122,125,121,121,124,128,128,139,144,146,142,141,129,122,127,118,117,120,127,128,149,151,133,130,122,116,117,111,105,111,117,112,116,117,116,95,96,87,84,89,96,84,88,84,84,67,71,66,57,53,59,61,69,73,76,89,93,99,99,91,95,98,94,92,92,91,93,100,99,103,93,107,107],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Virginia-hovers"
          transform="translate(284.505 219.61)"
        >
          <rect
            id="Virginia-mouse"
            x="0"
            y="-195"
            width="130"
            height="195"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.211384615384615)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,4,1,1,5,10,10,10,11,9,10,11,9,4,4,4,4,11,12,12,12,13,29,40,50,57,69,75,76,76,73,73,74,77,78,82,86,87,93,107,119,128,131,138,144,151,157,164,171,169,170,172,171,156,156,157,151,150,151,152,155,156,160,164,167,164,166,168,169,169,173,179,181,185,182,183,193,195,185,181,179,178,179,162,159,159,159,162,162,160,163,159,152,151,143,144,143,145,159,164,161,164,168,169,179,180,173,174,171,177,180,180,188,192,195,194],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="North Carolina-hovers"
          transform="translate(328.275 219.61)"
        >
          <rect
            id="North Carolina-mouse"
            x="0"
            y="-227"
            width="130"
            height="227"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.1815859030837)"
            data="{&quot;n_gages&quot;:[1,1,1,1,1,1,3,5,7,7,6,5,6,6,7,11,10,11,15,11,7,7,6,11,11,13,13,10,7,6,9,17,20,22,25,34,41,39,44,60,63,69,66,67,68,86,91,91,93,98,106,115,114,127,124,126,125,125,125,126,125,130,136,133,135,137,128,131,133,132,132,135,138,143,147,165,169,172,171,175,175,173,158,158,148,152,145,148,148,154,155,156,143,144,148,151,158,169,174,178,173,158,157,156,162,171,169,177,177,185,200,207,203,209,210,212,214,215,216,223,227,218,223,219,220,222,218,217,218,223],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="South Carolina-hovers"
          transform="translate(372.045 219.61)"
        >
          <rect
            id="South Carolina-mouse"
            x="0"
            y="-126"
            width="130"
            height="126"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.327142857142857)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,1,3,2,2,3,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,4,4,5,13,16,15,15,17,18,18,18,18,22,31,36,35,41,42,42,42,42,42,42,42,47,53,53,53,54,54,52,52,51,52,52,52,52,52,51,49,57,56,58,56,56,49,55,58,62,62,64,67,66,66,78,73,70,68,86,88,91,92,96,106,107,115,110,126,119,126,105,99,110,110,102,116,92,77,80,82,87,90,95,90,93,95,92,89,92,93,94,102,102],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Oklahoma-hovers"
          transform="translate(131.31 263.38)"
        >
          <rect
            id="Oklahoma-mouse"
            x="0"
            y="-146"
            width="130"
            height="146"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.282328767123288)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,5,10,8,2,1,1,1,0,2,2,1,2,2,2,2,0,0,0,0,1,5,5,5,5,6,9,11,9,9,9,13,20,24,43,56,65,67,67,71,74,81,81,82,85,88,91,89,96,105,103,103,110,111,111,108,118,122,129,124,116,118,124,128,123,126,133,117,113,110,114,115,113,109,113,128,128,127,116,113,115,117,118,117,120,127,126,120,127,131,112,110,114,121,121,124,127,130,131,130,132,131,132,134,133,133,134,132,131,131,135,136,140,145,145,146],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Louisiana-hovers"
          transform="translate(175.08 263.38)"
        >
          <rect
            id="Louisiana-mouse"
            x="0"
            y="-100"
            width="130"
            height="100"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.4122)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,0,0,0,0,4,5,4,2,2,3,4,5,8,9,22,29,36,36,44,48,51,53,54,54,61,68,68,69,69,68,69,80,86,84,86,87,98,98,99,100,95,93,85,84,69,73,64,64,67,64,67,65,65,63,65,64,72,70,66,67,59,56,51,52,50,52,50,49,40,43,47,40,44,45,49,50,50,54,61,62,61,55,54,53,53,56,58,62,60,59,58,47,48,53,50],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Mississippi-hovers"
          transform="translate(218.85 263.38)"
        >
          <rect
            id="Mississippi-mouse"
            x="0"
            y="-97"
            width="130"
            height="97"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.424948453608247)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,1,1,2,2,2,2,2,3,4,5,5,6,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,13,13,13,11,12,12,12,14,17,21,37,52,51,54,46,51,57,58,53,54,53,52,53,55,56,54,53,53,54,55,54,53,56,61,61,63,64,69,71,68,62,62,63,62,62,65,70,75,74,73,73,73,66,66,63,64,66,70,72,76,72,64,74,74,77,80,76,80,87,87,91,97,96,92,93,86,79,78,80,81,82,77,79,71,72,71,69,66,67,77,75],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Alabama-hovers"
          transform="translate(262.62 263.38)"
        >
          <rect
            id="Alabama-mouse"
            x="0"
            y="-134"
            width="130"
            height="134"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.307611940298507)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,1,2,3,3,3,3,8,8,7,8,9,10,10,8,8,8,8,8,10,9,6,6,5,5,5,3,3,3,10,12,13,8,11,9,21,25,29,21,23,24,24,31,31,38,50,66,65,68,68,74,81,83,82,82,82,81,79,82,93,92,92,91,102,105,110,120,117,117,118,121,119,109,108,97,93,90,69,55,55,53,64,75,87,83,89,83,90,79,77,75,74,73,76,80,90,91,100,92,96,98,96,100,105,105,114,116,117,119,125,121,122,123,114,115,118,121,124,120,120,117,121,122,122,134,133],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Georgia-hovers"
          transform="translate(306.39 263.38)"
        >
          <rect
            id="Georgia-mouse"
            x="0"
            y="-294"
            width="130"
            height="294"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.140204081632653)"
            data="{&quot;n_gages&quot;:[1,1,0,0,2,2,3,8,11,12,13,14,18,15,18,25,24,24,23,19,17,17,19,14,15,15,13,15,15,17,19,13,10,9,8,8,11,12,13,26,36,38,23,23,22,22,22,27,59,65,78,85,85,97,103,109,106,105,101,101,96,93,97,96,99,105,102,109,111,117,118,121,123,123,123,125,126,126,128,131,119,111,93,93,91,92,96,95,98,96,98,102,102,100,101,104,102,110,111,116,116,114,112,111,116,119,126,122,114,122,122,125,145,151,168,167,191,182,201,218,238,277,274,279,274,293,288,289,294,289],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Texas-hovers"
          transform="translate(131.31 307.15)"
        >
          <rect
            id="Texas-mouse"
            x="0"
            y="-514"
            width="130"
            height="514"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.0801945525291829)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,2,3,3,3,3,7,7,8,5,8,8,8,8,8,8,8,8,22,29,31,31,27,30,32,39,55,107,90,89,83,82,78,88,89,94,88,85,84,86,87,100,160,157,161,168,173,177,179,182,199,199,202,204,205,223,225,222,224,232,228,239,248,270,281,308,334,347,357,364,386,411,425,436,440,438,424,433,437,418,412,418,407,393,384,380,373,380,363,340,331,329,310,307,296,287,285,289,271,281,299,304,304,309,344,365,366,371,375,383,411,424,431,441,444,447,453,461,482,492,513,514],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Florida-hovers"
          transform="translate(350.16 307.15)"
        >
          <rect
            id="Florida-mouse"
            x="0"
            y="-451"
            width="130"
            height="451"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.0913968957871397)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,2,2,2,5,9,10,10,20,28,33,35,36,39,41,40,44,58,63,63,67,70,70,72,85,88,89,92,108,112,110,112,112,121,126,143,148,154,158,158,161,182,200,196,206,195,193,190,202,195,198,208,215,216,228,235,237,238,251,252,247,253,263,269,283,305,306,292,289,285,289,294,282,312,323,329,324,349,363,362,364,383,375,411,416,448,451,420,416,398,397,385,388,410,400,398,402],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Alaska-hovers"
          transform="translate(0 350.92)"
        >
          <rect
            id="Alaska-mouse"
            x="0"
            y="-121"
            width="130"
            height="121"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.340661157024793)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,2,2,11,15,15,15,14,13,12,12,13,12,7,8,11,11,11,12,13,10,8,8,7,7,6,4,4,3,2,2,1,2,3,10,23,28,45,48,61,58,60,57,61,59,62,63,67,73,73,81,92,94,111,114,116,117,114,120,121,118,102,104,102,103,111,103,106,110,101,99,101,96,82,72,70,68,74,74,90,81,68,65,61,59,72,85,94,93,100,103,95,98,95,92,92,94,100,107,107,96,97,93,84,84,85,87],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Hawaii-hovers"
          transform="translate(43.77 350.92)"
        >
          <rect
            id="Hawaii-mouse"
            x="0"
            y="-184"
            width="130"
            height="184"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.224021739130435)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,2,3,5,14,31,38,52,64,52,45,39,49,59,58,61,70,70,61,71,73,76,76,71,76,81,103,99,92,91,95,104,106,115,120,122,119,119,119,119,113,115,117,116,119,119,125,132,132,130,128,122,134,134,144,138,143,160,174,175,172,184,169,165,153,133,113,110,112,114,113,112,110,102,105,104,94,95,97,84,84,81,83,82,83,85,86,87,90,83,78,73,73,72,71,75,70,66,60,55,56,58,56,58,54,51,56,59,56,57,62,62,65],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <g
          id="Puerto Rico-hovers"
          transform="translate(437.7 350.92)"
        >
          <rect
            id="Puerto Rico-mouse"
            x="0"
            y="-94"
            width="130"
            height="94"
            style="fill:rgb(138,138,138); opacity:.2"
            transform="scale(0.317076923076923 0.438510638297872)"
            data="{&quot;n_gages&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,3,6,7,6,10,10,9,7,5,4,4,5,3,2,5,14,19,18,19,22,23,28,32,31,50,34,37,39,34,31,32,33,34,34,36,36,38,37,38,43,42,42,46,53,55,64,71,77,73,73,73,71,74,72,74,81,84,81,82,84,87,81,82,79,80,77,76,78,76,77,74,89,89,94],&quot;start_year&quot;:[1890]}"
            @mousemove="gagetip($event)"
            @mouseout="gagetip()"
          />
        </g>
        <!-- titles manually added to svg  -->
        <text
          id="title-svg"
          transform="translate(0 0)"
          style="font-size: 14px; font-weight:600; fill:rgb(139, 139, 139)"
        >State-level trends in USGS streamgaging<tspan
          x="0"
          y="15"
        >1890 - present</tspan></text>
        <!-- <text id="text-svg" transform="translate(0 35)" style="font-size: 10px; font-style: italic"><tspan x="0" y="0">Hover to see the number of streamgages over time</tspan></text> -->
        <text 
          id="annotate-svg" 
          transform="translate(175 325)"
          style="font-size: 10px;font-style: italic; fill:rgb(139, 139, 139)"
        ><tspan
           x="0"
           y="0"
         >Hover to see the number of</tspan>
          <tspan
            x="0"
            y="10"
          >streamgages in each state</tspan></text>
        <!--  <path 
        d="M548.76,335.22a28.54,28.54,0,0,0-19.47-2.86c-6.68,1.51-12.4,5.93-16.53,11.26-4.6,5.94-8.09,13.35-8.58,20.93a18.44,18.44,0,0,0,6.17,15.26c8.33,7.48,21.27,9.85,32,7.52a26.14,26.14,0,0,0,14.5-8.22c4.23-5,6.06-11.59,6.28-18A35.37,35.37,0,0,0,558,341a26,26,0,0,0-17.86-11.7,35.19,35.19,0,0,0-3.56-.37c-1.8-.08-1.8,2.73,0,2.81a23.7,23.7,0,0,1,16.48,7.4c4.31,4.69,6.61,11.08,7.18,17.35.54,6-.31,12.5-3.38,17.81a21.32,21.32,0,0,1-11.53,9.25,35.65,35.65,0,0,1-29.9-3.46c-3.86-2.46-7.12-6-8.1-10.57-1.43-6.67,1.31-14,4.62-19.65s8.23-11.06,14.54-13.71c5.94-2.5,12.76-2,18.64.39.77.32,1.52.68,2.26,1.07,1.6.84,3-1.58,1.41-2.43Z" 
        transform="translate(-162 -73)" class="annotate" /> -->
        <path
          id="arrow" 
          d="M446.47,402.11c-4.39-1.79,20.07,6.55,37.58.86a23.33,23.33,0,0,0,13.86-11.4l3,9.16L499.15,390l-11.31-.56,10.07,2.16"
          style="fill: none;stroke: rgb(139, 139, 139);stroke-linecap: round;stroke-linejoin: round;stroke-width: 3px"
          transform="translate(-142 -73)" 
          class="annotate"
        />    </svg>
    </div>
    <div
      v-for="paragraph in atlantaText.paragraphSections"
      :key="paragraph.aboveSliderText"
    >
      <p><span v-html="paragraph.aboveSliderText" /></p>
    </div>
    <div
      id="georgiaSlider"
      class="sliderContainer"
    >
      <div
        id="sliderOne"
        class="beer-slider"
        data-beer-label="2018"
      >
        <img
          src="@/assets/images/slider/georgiaAfter.jpg"
          alt="USGS Gages in Atlanta Georgia in 2018"
        >
        <div
          class="beer-reveal"
          data-beer-label="1967"
        >
          <img
            src="@/assets/images/slider/georgiaBefore.jpg"
            alt="USGS Gages in Atlanta Georgia in 1967"
          >
        </div>
      </div>
      <GeorgiaInsetMap />
    </div>
    <caption class="mapcaption">
      <span v-html="atlantaText.caption" />
    </caption>
  </div>
</template>
<script>
  import BeerSlider from "beerslider";
  import GeorgiaInsetMap from './georgiaInsetMap';
  import atlantaSliderText from "../assets/mapboxSlider/atlantaSliderText";
  export default {
      'name': 'MapImageSlider',
      components:{
            GeorgiaInsetMap
      },
      data(){
          return{
              atlantaText: atlantaSliderText.textContents,
              svg: null,
              pt: null
          }
      },
      mounted(){
          window.addEventListener('load', function(){
              new BeerSlider(document.getElementById('sliderOne'));
              new BeerSlider(document.getElementById('sliderTwo'));
          })
          this.svg = document.querySelector("#cartogram-svg");
          this.pt = this.svg.createSVGPoint();
      },
      methods: {
      
        cursorPoint(evt) {
          this.pt.x = evt.clientX; this.pt.y = evt.clientY;
          return this.pt.matrixTransform(this.svg.getScreenCTM().inverse());
        },
        
        gagetip(evt) {
      
          let tooltip = document.getElementById("tooltip");
          let tooltip_bg = document.getElementById("tooltip_bg");
          let tool_pt = document.getElementById("tool_pt");
        
          if (evt === undefined){
            tooltip.setAttribute("class","hidden");
            tooltip_bg.setAttribute("class","hidden");
            tool_pt.setAttribute("class","hidden");
          } else {
      
            this.pt = this.cursorPoint(evt);
            this.pt.x = Math.round(this.pt.x);
            this.pt.y = Math.round(this.pt.y);
      
            let svgWidth = Number(this.svg.getAttribute("viewBox").split(" ")[2]);
            tooltip.setAttribute("x",this.pt.x);
            tooltip.setAttribute("y",this.pt.y);
      
            let translate_elements = window.getComputedStyle(evt.target.parentElement).transform;
            let scale_elements = window.getComputedStyle(evt.target).transform;
      
            let scaleX = scale_elements.split(", ")[0].split("matrix(")[1];
            let translateX = translate_elements.split(", ")[4];
            let tip_JSON = evt.target.getAttribute("data");
            let tip_data = JSON.parse(tip_JSON);
            let pt_index = Math.round((this.pt.x - Math.round(translateX) ) / scaleX - 0.5);
            let state_id = evt.target.getAttribute("id").split("-")[0];
            let tip_text = state_id + " had " + tip_data.n_gages[pt_index] + " gages in " + (tip_data.start_year[0] + pt_index);
            tooltip.textContent = tip_text;
            var length = Math.round(tooltip.getComputedTextLength());
            
            if (this.pt.x - length/2 - 6 < 0){
              tooltip.setAttribute("x",length/2+6);
            } else if (this.pt.x + length/2 + 6 > svgWidth) {
              tooltip.setAttribute("x", svgWidth-length/2-6);
            }
      
            tool_pt.setAttribute("transform","translate("+this.pt.x+","+this.pt.y+")");
            tooltip_bg.setAttribute("x",tooltip.getAttribute("x")-length/2-6);
            tooltip_bg.setAttribute("y",this.pt.y-41);
            tooltip.setAttribute("class","shown");
            tooltip_bg.setAttribute("class","tooltip-box");
            tool_pt.setAttribute("class","tooltip-box");
            tooltip_bg.setAttribute("width", length+12);
      
          }
        }
        
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
    margin-top: 10px;
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
#cartogram-svg {
  width:150%;
  height: auto;

.state-label{
  font-size: 12px;
  font-weight: 600;
  fill: white;
  text-anchor: end;

}
  .state-trend  {
  fill: #00264c;
}
#annotate-map {
  fill:none;
  stroke:#00264c;
  stroke-width:5px;
}
 .annotate {
    fill: rgb(139, 139, 139);
    stroke: rgb(139, 139, 139);
    stroke-linecap: round;
    stroke-linejoin: round;
    stroke-width: 1px;
}
}
.hidden {
  opacity:.2;
}
.tooltip-box{
  stroke-width: 0.5;
  stroke: #696969;
  opacity: 0.95;
  fill: #f2f2f2;
}
#tooltip{
  font-size: 12px;
}

@media screen and (min-width: 600px){
    .beer-slider[data-beer-label]:after,
    .beer-reveal[data-beer-label]:after{
        font-size: 1.5em;
    }
}
</style>