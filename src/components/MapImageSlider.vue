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
        id="cartoUSA"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 -50 800 420"
        preserveAspectRatio="xMidYMid meet"
        version="1.1"
      >
        <g
          id="Maine-bars"
          transform="translate(459.585 0.76) scale(0.317076923076923 0.6440625)"
        >
          <path
            id="Maine-counts"
            d="M0,0 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-6 h1 v-1 h1 v-2 h1 v-2 h1 v2 h1 v-2 h1 v0 h1 v-3 h1 v-1 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v1 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v-1 h1 v-1 h1 v-3 h1 v-6 h1 v-2 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-2 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-5 h1 v0 h1 v0 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-1 h1 v-3 h1 v7 h1 v-3 h1 v-2 h1 v11 h1 v5 h1 v4 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v-1 h1 v0 h1 v3 h1 v1 h1 v1 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v-3 h1 v-8 h1 v-2 h1 v-3 h1 v1 h1 v-1 h1 v-1 h1 v0 h1 v5 h1 v-2 h1 v-6 h1 v-4 h1 v-1 h1 v0 h1 v2 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v61Z"
          />
        </g>
        <g
          id="Vermont-bars"
          transform="translate(415.815 44.53) scale(0.317076923076923 0.749454545454545)"
        >
          <path
            id="Vermont-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v2 h1 v-2 h1 v-1 h1 v-1 h1 v-4 h1 v1 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v1 h1 v-2 h1 v5 h1 v1 h1 v0 h1 v0 h1 v1 h1 v-14 h1 v-3 h1 v-1 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-3 h1 v-6 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-11 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v2 h1 v9 h1 v1 h1 v-2 h1 v2 h1 v0 h1 v1 h1 v0 h1 v-4 h1 v6 h1 v2 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v4 h1 v-11 h1 v3 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v-2 h1 v2 h1 v0 h1 v0 h1 v-5 h1 v-6 h1 v10 h1 v-1 h1 v1 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v47Z"
          />
        </g>
        <g
          id="New Hampshire-bars"
          transform="translate(459.585 44.53) scale(0.317076923076923 0.675737704918033)"
        >
          <path
            id="New Hampshire-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v1 h1 v0 h1 v-2 h1 v-3 h1 v-2 h1 v0 h1 v1 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v-4 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v-2 h1 v0 h1 v-2 h1 v-1 h1 v-7 h1 v-4 h1 v-1 h1 v-2 h1 v0 h1 v0 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v-5 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v4 h1 v0 h1 v-1 h1 v2 h1 v0 h1 v0 h1 v3 h1 v5 h1 v6 h1 v-1 h1 v4 h1 v0 h1 v-1 h1 v1 h1 v1 h1 v1 h1 v-2 h1 v0 h1 v-1 h1 v6 h1 v2 h1 v0 h1 v-1 h1 v-2 h1 v-3 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-7 h1 v-1 h1 v-4 h1 v12 h1 v-1 h1 v-2 h1 v4 h1 v-7 h1 v-8 h1 v4 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v-1 h1 v0 h1 v53Z"
          />
        </g>
        <g
          id="Washington-bars"
          transform="translate(0 88.3) scale(0.317076923076923 0.121235294117647)"
        >
          <path
            id="Washington-counts"
            d="M0,0 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v1 h1 v-1 h1 v3 h1 v-2 h1 v-5 h1 v-1 h1 v-1 h1 v3 h1 v-9 h1 v-10 h1 v-14 h1 v-16 h1 v-10 h1 v15 h1 v-16 h1 v4 h1 v18 h1 v-10 h1 v1 h1 v-3 h1 v-3 h1 v2 h1 v0 h1 v7 h1 v1 h1 v-5 h1 v0 h1 v5 h1 v-11 h1 v-22 h1 v-36 h1 v4 h1 v11 h1 v9 h1 v1 h1 v-6 h1 v-2 h1 v-3 h1 v-5 h1 v0 h1 v-10 h1 v0 h1 v-8 h1 v-6 h1 v-18 h1 v-20 h1 v-45 h1 v-27 h1 v-7 h1 v1 h1 v0 h1 v16 h1 v-6 h1 v-9 h1 v0 h1 v3 h1 v-5 h1 v-4 h1 v-8 h1 v-1 h1 v-6 h1 v-22 h1 v-10 h1 v-6 h1 v-19 h1 v-10 h1 v11 h1 v1 h1 v-8 h1 v14 h1 v16 h1 v20 h1 v34 h1 v13 h1 v13 h1 v-5 h1 v4 h1 v-10 h1 v13 h1 v13 h1 v14 h1 v1 h1 v14 h1 v-6 h1 v3 h1 v-15 h1 v1 h1 v12 h1 v-7 h1 v2 h1 v13 h1 v-8 h1 v-1 h1 v-6 h1 v-12 h1 v0 h1 v5 h1 v-10 h1 v-3 h1 v5 h1 v-3 h1 v-1 h1 v-9 h1 v-7 h1 v8 h1 v3 h1 v-4 h1 v-8 h1 v-2 h1 v-2 h1 v5 h1 v-6 h1 v-3 h1 v0 h1 v-1 h1 v-4 h1 v4 h1 v-2 h1 v-3 h1 v-6 h1 v250Z"
          />
        </g>
        <g
          id="Idaho-bars"
          transform="translate(43.77 88.3) scale(0.317076923076923 0.198173076923077)"
        >
          <path
            id="Idaho-counts"
            d="M0,0 v0 h1 v-2 h1 v1 h1 v0 h1 v1 h1 v0 h1 v-4 h1 v3 h1 v0 h1 v-3 h1 v3 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v-1 h1 v2 h1 v-3 h1 v-1 h1 v-9 h1 v-21 h1 v-20 h1 v3 h1 v-2 h1 v16 h1 v-1 h1 v10 h1 v-3 h1 v-3 h1 v-19 h1 v-10 h1 v-16 h1 v7 h1 v-1 h1 v-2 h1 v-5 h1 v-2 h1 v4 h1 v-16 h1 v-7 h1 v-7 h1 v-14 h1 v7 h1 v2 h1 v-2 h1 v-4 h1 v-4 h1 v-13 h1 v-3 h1 v-21 h1 v-5 h1 v6 h1 v-5 h1 v-1 h1 v-11 h1 v-5 h1 v-12 h1 v4 h1 v4 h1 v9 h1 v-5 h1 v-2 h1 v16 h1 v-3 h1 v-1 h1 v-12 h1 v3 h1 v-1 h1 v-5 h1 v9 h1 v1 h1 v-2 h1 v5 h1 v0 h1 v-4 h1 v-2 h1 v-4 h1 v-4 h1 v1 h1 v8 h1 v2 h1 v15 h1 v3 h1 v7 h1 v4 h1 v-2 h1 v-6 h1 v7 h1 v-2 h1 v-6 h1 v-1 h1 v9 h1 v13 h1 v-1 h1 v-8 h1 v-53 h1 v16 h1 v6 h1 v0 h1 v4 h1 v5 h1 v-5 h1 v3 h1 v1 h1 v5 h1 v0 h1 v3 h1 v4 h1 v-9 h1 v0 h1 v-5 h1 v-4 h1 v-5 h1 v2 h1 v-1 h1 v0 h1 v9 h1 v0 h1 v2 h1 v-2 h1 v-8 h1 v-13 h1 v5 h1 v4 h1 v-3 h1 v-6 h1 v1 h1 v-15 h1 v4 h1 v204Z"
          />
        </g>
        <g
          id="Montana-bars"
          transform="translate(87.54 88.3) scale(0.317076923076923 0.204059405940594)"
        >
          <path
            id="Montana-counts"
            d="M0,0 v-4 h1 v-1 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-1 h1 v-3 h1 v1 h1 v1 h1 v-5 h1 v-4 h1 v0 h1 v-1 h1 v-1 h1 v-14 h1 v-9 h1 v-16 h1 v-8 h1 v9 h1 v6 h1 v-6 h1 v12 h1 v-4 h1 v6 h1 v-3 h1 v-4 h1 v0 h1 v-4 h1 v-8 h1 v-7 h1 v11 h1 v13 h1 v2 h1 v2 h1 v4 h1 v-20 h1 v-8 h1 v-8 h1 v-4 h1 v28 h1 v5 h1 v-31 h1 v-14 h1 v1 h1 v1 h1 v-12 h1 v-15 h1 v1 h1 v-10 h1 v14 h1 v0 h1 v-1 h1 v-16 h1 v-25 h1 v-12 h1 v-10 h1 v2 h1 v-6 h1 v-23 h1 v4 h1 v59 h1 v1 h1 v-9 h1 v4 h1 v-7 h1 v-2 h1 v-8 h1 v-7 h1 v0 h1 v-3 h1 v6 h1 v-5 h1 v-3 h1 v5 h1 v5 h1 v-2 h1 v17 h1 v2 h1 v5 h1 v-8 h1 v0 h1 v-5 h1 v-8 h1 v2 h1 v-3 h1 v-8 h1 v-1 h1 v-1 h1 v0 h1 v-18 h1 v-6 h1 v4 h1 v21 h1 v8 h1 v7 h1 v0 h1 v0 h1 v1 h1 v0 h1 v15 h1 v0 h1 v-7 h1 v7 h1 v7 h1 v-4 h1 v0 h1 v-5 h1 v-8 h1 v-7 h1 v1 h1 v-5 h1 v8 h1 v-3 h1 v15 h1 v-8 h1 v-3 h1 v1 h1 v3 h1 v4 h1 v-12 h1 v3 h1 v-7 h1 v-4 h1 v4 h1 v3 h1 v-5 h1 v162Z"
          />
        </g>
        <g
          id="North Dakota-bars"
          transform="translate(131.31 88.3) scale(0.317076923076923 0.312272727272727)"
        >
          <path
            id="North Dakota-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-6 h1 v-2 h1 v1 h1 v2 h1 v-1 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-6 h1 v-3 h1 v-2 h1 v-2 h1 v3 h1 v2 h1 v-2 h1 v-1 h1 v-1 h1 v-6 h1 v-4 h1 v-3 h1 v-1 h1 v0 h1 v0 h1 v-8 h1 v-3 h1 v-9 h1 v-4 h1 v0 h1 v-2 h1 v-6 h1 v-4 h1 v0 h1 v-1 h1 v-1 h1 v-3 h1 v-3 h1 v-12 h1 v-7 h1 v0 h1 v-3 h1 v-1 h1 v-3 h1 v-1 h1 v2 h1 v-3 h1 v-6 h1 v-2 h1 v0 h1 v1 h1 v0 h1 v4 h1 v-2 h1 v2 h1 v-1 h1 v-3 h1 v5 h1 v-1 h1 v-18 h1 v-8 h1 v3 h1 v-1 h1 v27 h1 v21 h1 v4 h1 v3 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v3 h1 v-1 h1 v-4 h1 v-4 h1 v6 h1 v4 h1 v0 h1 v1 h1 v1 h1 v-1 h1 v-1 h1 v-4 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-3 h1 v-2 h1 v-2 h1 v1 h1 v-2 h1 v2 h1 v-1 h1 v4 h1 v1 h1 v-1 h1 v-2 h1 v80Z"
          />
        </g>
        <g
          id="Minnesota-bars"
          transform="translate(175.08 88.3) scale(0.317076923076923 0.340661157024793)"
        >
          <path
            id="Minnesota-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-13 h1 v-2 h1 v-9 h1 v0 h1 v3 h1 v4 h1 v-4 h1 v2 h1 v19 h1 v-1 h1 v1 h1 v-3 h1 v1 h1 v-1 h1 v-3 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-12 h1 v-6 h1 v-9 h1 v-3 h1 v2 h1 v-3 h1 v-8 h1 v-5 h1 v1 h1 v1 h1 v1 h1 v-13 h1 v-6 h1 v-2 h1 v-11 h1 v0 h1 v-6 h1 v-4 h1 v-4 h1 v5 h1 v-2 h1 v-6 h1 v1 h1 v-2 h1 v-7 h1 v-7 h1 v4 h1 v5 h1 v3 h1 v0 h1 v3 h1 v-3 h1 v-3 h1 v7 h1 v9 h1 v-3 h1 v5 h1 v-6 h1 v-3 h1 v-8 h1 v-9 h1 v1 h1 v7 h1 v2 h1 v-5 h1 v-1 h1 v2 h1 v-7 h1 v-5 h1 v1 h1 v13 h1 v6 h1 v7 h1 v12 h1 v-7 h1 v5 h1 v3 h1 v-2 h1 v3 h1 v-2 h1 v-6 h1 v7 h1 v4 h1 v-5 h1 v-1 h1 v3 h1 v2 h1 v-5 h1 v-2 h1 v-1 h1 v2 h1 v1 h1 v2 h1 v-6 h1 v-6 h1 v1 h1 v-5 h1 v-1 h1 v1 h1 v-3 h1 v3 h1 v4 h1 v-1 h1 v-9 h1 v3 h1 v-3 h1 v-5 h1 v3 h1 v1 h1 v0 h1 v-2 h1 v106Z"
          />
        </g>
        <g
          id="Wisconsin-bars"
          transform="translate(218.85 88.3) scale(0.317076923076923 0.208181818181818)"
        >
          <path
            id="Wisconsin-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v2 h1 v-2 h1 v-1 h1 v-3 h1 v6 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v-7 h1 v-30 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v2 h1 v-1 h1 v3 h1 v1 h1 v0 h1 v-2 h1 v3 h1 v-1 h1 v1 h1 v-4 h1 v1 h1 v-3 h1 v0 h1 v-1 h1 v-1 h1 v-6 h1 v-2 h1 v-1 h1 v-1 h1 v-3 h1 v-8 h1 v0 h1 v-1 h1 v-7 h1 v0 h1 v-13 h1 v1 h1 v-3 h1 v1 h1 v-4 h1 v0 h1 v-2 h1 v3 h1 v-1 h1 v1 h1 v4 h1 v5 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-1 h1 v7 h1 v0 h1 v-8 h1 v-6 h1 v3 h1 v-3 h1 v0 h1 v-8 h1 v4 h1 v5 h1 v-7 h1 v-7 h1 v5 h1 v-1 h1 v-12 h1 v-16 h1 v5 h1 v-6 h1 v15 h1 v4 h1 v18 h1 v-2 h1 v1 h1 v-2 h1 v2 h1 v1 h1 v-4 h1 v-13 h1 v-4 h1 v6 h1 v-7 h1 v-1 h1 v-10 h1 v-1 h1 v16 h1 v-4 h1 v-4 h1 v-18 h1 v-6 h1 v7 h1 v-5 h1 v-9 h1 v-7 h1 v-16 h1 v-6 h1 v12 h1 v-4 h1 v5 h1 v-1 h1 v-11 h1 v-3 h1 v-10 h1 v4 h1 v-1 h1 v4 h1 v0 h1 v-8 h1 v0 h1 v198Z"
          />
        </g>
        <g
          id="Michigan-bars"
          transform="translate(284.505 88.3) scale(0.317076923076923 0.191720930232558)"
        >
          <path
            id="Michigan-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v-1 h1 v0 h1 v1 h1 v2 h1 v1 h1 v0 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v3 h1 v-2 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-11 h1 v0 h1 v-5 h1 v1 h1 v-7 h1 v-3 h1 v2 h1 v-5 h1 v-12 h1 v-4 h1 v-1 h1 v7 h1 v-22 h1 v-1 h1 v-13 h1 v-9 h1 v-4 h1 v-7 h1 v-12 h1 v-1 h1 v-12 h1 v-10 h1 v-10 h1 v0 h1 v-8 h1 v-1 h1 v0 h1 v1 h1 v-7 h1 v-8 h1 v-5 h1 v-7 h1 v-6 h1 v2 h1 v-9 h1 v-10 h1 v-7 h1 v-3 h1 v3 h1 v-1 h1 v5 h1 v2 h1 v5 h1 v3 h1 v-4 h1 v3 h1 v0 h1 v8 h1 v3 h1 v-2 h1 v9 h1 v15 h1 v21 h1 v6 h1 v3 h1 v-1 h1 v1 h1 v-7 h1 v-4 h1 v2 h1 v-1 h1 v3 h1 v-1 h1 v7 h1 v-5 h1 v4 h1 v-2 h1 v0 h1 v-2 h1 v-2 h1 v-5 h1 v-10 h1 v-7 h1 v6 h1 v-10 h1 v8 h1 v4 h1 v2 h1 v0 h1 v2 h1 v1 h1 v11 h1 v-8 h1 v5 h1 v-14 h1 v-5 h1 v3 h1 v1 h1 v-2 h1 v162Z"
          />
        </g>
        <g
          id="New York-bars"
          transform="translate(372.045 88.3) scale(0.317076923076923 0.139728813559322)"
        >
          <path
            id="New York-counts"
            d="M0,0 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-4 h1 v-1 h1 v-2 h1 v0 h1 v-4 h1 v3 h1 v-10 h1 v-1 h1 v2 h1 v0 h1 v-4 h1 v-4 h1 v0 h1 v-2 h1 v-6 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v-7 h1 v0 h1 v-1 h1 v-5 h1 v-14 h1 v-4 h1 v-4 h1 v-5 h1 v-5 h1 v-2 h1 v-7 h1 v-1 h1 v8 h1 v-6 h1 v-3 h1 v-2 h1 v-1 h1 v-28 h1 v-19 h1 v-3 h1 v-11 h1 v-1 h1 v-2 h1 v-3 h1 v-12 h1 v-5 h1 v-4 h1 v-2 h1 v-1 h1 v-4 h1 v-5 h1 v-4 h1 v-2 h1 v0 h1 v-2 h1 v-8 h1 v0 h1 v-8 h1 v-8 h1 v-6 h1 v-16 h1 v1 h1 v9 h1 v5 h1 v-16 h1 v-2 h1 v1 h1 v-7 h1 v71 h1 v4 h1 v4 h1 v-3 h1 v-3 h1 v0 h1 v-5 h1 v-1 h1 v4 h1 v1 h1 v-2 h1 v-3 h1 v-2 h1 v7 h1 v2 h1 v6 h1 v-2 h1 v0 h1 v1 h1 v3 h1 v2 h1 v8 h1 v-18 h1 v-13 h1 v-1 h1 v-8 h1 v14 h1 v5 h1 v-2 h1 v-17 h1 v-6 h1 v6 h1 v-8 h1 v-7 h1 v-3 h1 v-3 h1 v1 h1 v-8 h1 v-1 h1 v0 h1 v9 h1 v-6 h1 v7 h1 v-5 h1 v-3 h1 v6 h1 v-15 h1 v-10 h1 v-6 h1 v-16 h1 v-15 h1 v295Z"
          />
        </g>
        <g
          id="Massachusetts-bars"
          transform="translate(415.815 88.3) scale(0.317076923076923 0.358434782608696)"
        >
          <path
            id="Massachusetts-counts"
            d="M0,0 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-3 h1 v-3 h1 v-1 h1 v-1 h1 v-5 h1 v2 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-3 h1 v-1 h1 v-8 h1 v-4 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-3 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v2 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v3 h1 v-3 h1 v-5 h1 v-5 h1 v-1 h1 v-2 h1 v-9 h1 v1 h1 v0 h1 v-1 h1 v-3 h1 v3 h1 v-4 h1 v0 h1 v6 h1 v0 h1 v0 h1 v-2 h1 v6 h1 v0 h1 v1 h1 v0 h1 v5 h1 v2 h1 v-4 h1 v0 h1 v3 h1 v0 h1 v1 h1 v2 h1 v6 h1 v2 h1 v-1 h1 v0 h1 v-5 h1 v-4 h1 v2 h1 v-7 h1 v3 h1 v-6 h1 v4 h1 v-2 h1 v-7 h1 v-1 h1 v-3 h1 v-1 h1 v-15 h1 v-11 h1 v-2 h1 v22 h1 v-2 h1 v-3 h1 v-1 h1 v-1 h1 v-4 h1 v-2 h1 v6 h1 v-1 h1 v0 h1 v101Z"
          />
        </g>
        <g
          id="Rhode Island-bars"
          transform="translate(459.585 88.3) scale(0.317076923076923 1.11405405405405)"
        >
          <path
            id="Rhode Island-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v3 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v-5 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v6 h1 v-3 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v-1 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v2 h1 v-8 h1 v-1 h1 v4 h1 v5 h1 v-1 h1 v-5 h1 v-11 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v4 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v31Z"
          />
        </g>
        <g
          id="Oregon-bars"
          transform="translate(0 132.07) scale(0.317076923076923 0.130031545741325)"
        >
          <path
            id="Oregon-counts"
            d="M0,0 v-1 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v-3 h1 v2 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-8 h1 v-4 h1 v-12 h1 v1 h1 v-4 h1 v-3 h1 v-8 h1 v-10 h1 v1 h1 v-3 h1 v-4 h1 v8 h1 v6 h1 v4 h1 v-6 h1 v3 h1 v-5 h1 v-1 h1 v-5 h1 v-4 h1 v-8 h1 v-17 h1 v-8 h1 v-13 h1 v0 h1 v-14 h1 v-12 h1 v-4 h1 v-5 h1 v3 h1 v-9 h1 v-1 h1 v-14 h1 v-2 h1 v-10 h1 v-11 h1 v-11 h1 v-18 h1 v-3 h1 v-3 h1 v2 h1 v-3 h1 v1 h1 v-10 h1 v-4 h1 v-4 h1 v-10 h1 v-3 h1 v-1 h1 v4 h1 v6 h1 v-2 h1 v-4 h1 v-2 h1 v0 h1 v-2 h1 v-1 h1 v-18 h1 v-3 h1 v-2 h1 v-14 h1 v1 h1 v-10 h1 v-13 h1 v-9 h1 v7 h1 v0 h1 v8 h1 v4 h1 v-5 h1 v11 h1 v0 h1 v-21 h1 v9 h1 v0 h1 v-6 h1 v7 h1 v-1 h1 v24 h1 v-2 h1 v4 h1 v1 h1 v4 h1 v3 h1 v14 h1 v3 h1 v4 h1 v10 h1 v54 h1 v-3 h1 v-4 h1 v7 h1 v2 h1 v-3 h1 v6 h1 v-3 h1 v-2 h1 v1 h1 v-5 h1 v-10 h1 v-9 h1 v6 h1 v-3 h1 v6 h1 v-7 h1 v11 h1 v-2 h1 v0 h1 v-4 h1 v0 h1 v2 h1 v-4 h1 v2 h1 v1 h1 v-5 h1 v-1 h1 v206Z"
          />
        </g>
        <g
          id="Nevada-bars"
          transform="translate(43.77 132.07) scale(0.317076923076923 0.28625)"
        >
          <path
            id="Nevada-counts"
            d="M0,0 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-2 h1 v1 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v2 h1 v-2 h1 v0 h1 v3 h1 v-1 h1 v3 h1 v-1 h1 v-8 h1 v-1 h1 v-11 h1 v-2 h1 v-1 h1 v4 h1 v1 h1 v0 h1 v0 h1 v-3 h1 v-6 h1 v7 h1 v4 h1 v5 h1 v-3 h1 v2 h1 v2 h1 v1 h1 v0 h1 v-2 h1 v1 h1 v2 h1 v1 h1 v1 h1 v-2 h1 v-2 h1 v1 h1 v0 h1 v-4 h1 v0 h1 v3 h1 v-1 h1 v-6 h1 v-4 h1 v-5 h1 v-5 h1 v-3 h1 v-9 h1 v0 h1 v-1 h1 v-3 h1 v1 h1 v0 h1 v1 h1 v3 h1 v0 h1 v-3 h1 v0 h1 v-2 h1 v-3 h1 v-5 h1 v-3 h1 v-8 h1 v-2 h1 v-8 h1 v-8 h1 v-2 h1 v3 h1 v-1 h1 v0 h1 v1 h1 v4 h1 v3 h1 v-2 h1 v-3 h1 v-5 h1 v-10 h1 v0 h1 v-1 h1 v0 h1 v13 h1 v9 h1 v2 h1 v-6 h1 v-1 h1 v2 h1 v2 h1 v-13 h1 v-13 h1 v-14 h1 v-12 h1 v-7 h1 v-5 h1 v1 h1 v16 h1 v4 h1 v0 h1 v4 h1 v-1 h1 v2 h1 v-2 h1 v-12 h1 v-7 h1 v14 h1 v-7 h1 v-5 h1 v1 h1 v5 h1 v3 h1 v-1 h1 v-4 h1 v2 h1 v0 h1 v-12 h1 v7 h1 v1 h1 v-1 h1 v-1 h1 v137Z"
          />
        </g>
        <g
          id="Wyoming-bars"
          transform="translate(87.54 132.07) scale(0.317076923076923 0.205074626865672)"
        >
          <path
            id="Wyoming-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v1 h1 v1 h1 v0 h1 v-3 h1 v-2 h1 v-4 h1 v1 h1 v4 h1 v1 h1 v0 h1 v1 h1 v-8 h1 v-9 h1 v5 h1 v-8 h1 v-9 h1 v-17 h1 v0 h1 v4 h1 v-3 h1 v-2 h1 v-3 h1 v-5 h1 v2 h1 v2 h1 v19 h1 v0 h1 v1 h1 v5 h1 v-10 h1 v-8 h1 v-11 h1 v1 h1 v5 h1 v-2 h1 v-1 h1 v-2 h1 v-1 h1 v-5 h1 v-30 h1 v-7 h1 v-4 h1 v-8 h1 v-3 h1 v0 h1 v-3 h1 v-14 h1 v-21 h1 v-3 h1 v-8 h1 v-17 h1 v-7 h1 v-6 h1 v-4 h1 v16 h1 v-1 h1 v0 h1 v-8 h1 v2 h1 v3 h1 v-4 h1 v5 h1 v-9 h1 v-5 h1 v8 h1 v3 h1 v-5 h1 v-8 h1 v7 h1 v13 h1 v7 h1 v4 h1 v44 h1 v0 h1 v3 h1 v-13 h1 v-19 h1 v4 h1 v-11 h1 v0 h1 v5 h1 v3 h1 v23 h1 v-4 h1 v3 h1 v19 h1 v-8 h1 v5 h1 v-4 h1 v-8 h1 v2 h1 v-6 h1 v-6 h1 v16 h1 v7 h1 v-3 h1 v8 h1 v15 h1 v8 h1 v3 h1 v-2 h1 v-4 h1 v-4 h1 v-2 h1 v-7 h1 v-6 h1 v10 h1 v0 h1 v1 h1 v1 h1 v1 h1 v-2 h1 v-2 h1 v2 h1 v1 h1 v-6 h1 v3 h1 v2 h1 v6 h1 v-3 h1 v95Z"
          />
        </g>
        <g
          id="South Dakota-bars"
          transform="translate(131.31 132.07) scale(0.317076923076923 0.305333333333333)"
        >
          <path
            id="South Dakota-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v-1 h1 v-4 h1 v0 h1 v0 h1 v-1 h1 v-7 h1 v-2 h1 v5 h1 v-1 h1 v-1 h1 v-8 h1 v1 h1 v-22 h1 v-1 h1 v-3 h1 v-5 h1 v-4 h1 v-9 h1 v0 h1 v0 h1 v-3 h1 v-2 h1 v-5 h1 v0 h1 v0 h1 v2 h1 v-6 h1 v-1 h1 v-3 h1 v-7 h1 v0 h1 v0 h1 v-4 h1 v-3 h1 v0 h1 v-3 h1 v6 h1 v1 h1 v-4 h1 v8 h1 v0 h1 v1 h1 v-3 h1 v-5 h1 v2 h1 v-4 h1 v1 h1 v5 h1 v-2 h1 v-7 h1 v3 h1 v-7 h1 v2 h1 v3 h1 v-18 h1 v-14 h1 v10 h1 v1 h1 v-2 h1 v0 h1 v0 h1 v4 h1 v5 h1 v-1 h1 v6 h1 v7 h1 v-4 h1 v-3 h1 v0 h1 v7 h1 v1 h1 v-1 h1 v2 h1 v0 h1 v-3 h1 v2 h1 v1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v2 h1 v103Z"
          />
        </g>
        <g
          id="Iowa-bars"
          transform="translate(175.08 132.07) scale(0.317076923076923 0.276644295302013)"
        >
          <path
            id="Iowa-counts"
            d="M0,0 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v-3 h1 v-4 h1 v-2 h1 v1 h1 v-1 h1 v-4 h1 v-3 h1 v-4 h1 v0 h1 v-1 h1 v0 h1 v4 h1 v0 h1 v0 h1 v7 h1 v-3 h1 v-1 h1 v0 h1 v2 h1 v-6 h1 v-6 h1 v-4 h1 v0 h1 v-5 h1 v-1 h1 v-3 h1 v-5 h1 v-12 h1 v0 h1 v2 h1 v0 h1 v1 h1 v-10 h1 v-2 h1 v-1 h1 v-5 h1 v-3 h1 v-1 h1 v0 h1 v-7 h1 v0 h1 v-3 h1 v-4 h1 v-4 h1 v-3 h1 v-7 h1 v-2 h1 v-2 h1 v0 h1 v-2 h1 v-3 h1 v0 h1 v-3 h1 v-1 h1 v-1 h1 v0 h1 v6 h1 v0 h1 v-4 h1 v-2 h1 v7 h1 v6 h1 v-3 h1 v1 h1 v-10 h1 v0 h1 v2 h1 v5 h1 v2 h1 v4 h1 v1 h1 v-1 h1 v-4 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v2 h1 v-2 h1 v1 h1 v-2 h1 v2 h1 v1 h1 v1 h1 v3 h1 v-1 h1 v-6 h1 v-6 h1 v-2 h1 v-3 h1 v1 h1 v5 h1 v-2 h1 v-3 h1 v4 h1 v-3 h1 v-11 h1 v-3 h1 v-6 h1 v0 h1 v-3 h1 v9 h1 v-3 h1 v5 h1 v0 h1 v138Z"
          />
        </g>
        <g
          id="Illinois-bars"
          transform="translate(218.85 132.07) scale(0.317076923076923 0.213575129533679)"
        >
          <path
            id="Illinois-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v-9 h1 v-6 h1 v-2 h1 v1 h1 v16 h1 v0 h1 v-18 h1 v-5 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v-3 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v1 h1 v0 h1 v-4 h1 v-1 h1 v-1 h1 v-2 h1 v0 h1 v5 h1 v-7 h1 v-1 h1 v-5 h1 v3 h1 v-3 h1 v-33 h1 v-15 h1 v-2 h1 v-4 h1 v-2 h1 v-12 h1 v-5 h1 v0 h1 v2 h1 v-15 h1 v-12 h1 v-9 h1 v-7 h1 v-3 h1 v0 h1 v-3 h1 v0 h1 v2 h1 v-2 h1 v15 h1 v-5 h1 v-1 h1 v-3 h1 v2 h1 v1 h1 v-1 h1 v-4 h1 v-2 h1 v-7 h1 v-3 h1 v-3 h1 v-4 h1 v17 h1 v-5 h1 v-2 h1 v-1 h1 v6 h1 v0 h1 v0 h1 v-8 h1 v1 h1 v-4 h1 v7 h1 v22 h1 v0 h1 v0 h1 v2 h1 v4 h1 v0 h1 v-6 h1 v-8 h1 v1 h1 v-4 h1 v4 h1 v1 h1 v-3 h1 v0 h1 v2 h1 v0 h1 v0 h1 v-3 h1 v-3 h1 v0 h1 v-5 h1 v3 h1 v-2 h1 v-2 h1 v-2 h1 v-6 h1 v1 h1 v-7 h1 v-4 h1 v-3 h1 v-4 h1 v-1 h1 v4 h1 v1 h1 v4 h1 v-10 h1 v8 h1 v185Z"
          />
        </g>
        <g
          id="Indiana-bars"
          transform="translate(262.62 132.07) scale(0.317076923076923 0.20713567839196)"
        >
          <path
            id="Indiana-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v-1 h1 v-3 h1 v2 h1 v-4 h1 v-4 h1 v-2 h1 v-4 h1 v-7 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-8 h1 v-4 h1 v-3 h1 v-2 h1 v-12 h1 v-4 h1 v-3 h1 v-5 h1 v-4 h1 v-14 h1 v-7 h1 v-1 h1 v2 h1 v-5 h1 v0 h1 v-3 h1 v-9 h1 v-2 h1 v-8 h1 v-3 h1 v-5 h1 v-4 h1 v-4 h1 v-1 h1 v-2 h1 v-7 h1 v-2 h1 v-6 h1 v-5 h1 v-13 h1 v-11 h1 v-10 h1 v8 h1 v4 h1 v10 h1 v0 h1 v-1 h1 v4 h1 v1 h1 v1 h1 v-3 h1 v-9 h1 v7 h1 v10 h1 v-2 h1 v2 h1 v-3 h1 v-1 h1 v1 h1 v1 h1 v-8 h1 v-1 h1 v8 h1 v0 h1 v9 h1 v1 h1 v1 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v3 h1 v9 h1 v3 h1 v24 h1 v-3 h1 v1 h1 v-5 h1 v-12 h1 v-3 h1 v-6 h1 v-6 h1 v-4 h1 v-7 h1 v10 h1 v3 h1 v-20 h1 v-4 h1 v-4 h1 v0 h1 v181Z"
          />
        </g>
        <g
          id="Ohio-bars"
          transform="translate(306.39 132.07) scale(0.317076923076923 0.180789473684211)"
        >
          <path
            id="Ohio-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-2 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-4 h1 v-12 h1 v-3 h1 v4 h1 v1 h1 v-1 h1 v0 h1 v-23 h1 v-2 h1 v-13 h1 v-7 h1 v-15 h1 v-10 h1 v-5 h1 v1 h1 v-3 h1 v-2 h1 v-5 h1 v10 h1 v1 h1 v0 h1 v42 h1 v0 h1 v-5 h1 v-23 h1 v-28 h1 v-8 h1 v-10 h1 v-9 h1 v-5 h1 v-1 h1 v-7 h1 v-15 h1 v6 h1 v4 h1 v2 h1 v-2 h1 v8 h1 v-7 h1 v4 h1 v-3 h1 v0 h1 v1 h1 v-2 h1 v6 h1 v0 h1 v-5 h1 v1 h1 v-2 h1 v-3 h1 v-3 h1 v-10 h1 v-2 h1 v-3 h1 v-4 h1 v1 h1 v-3 h1 v4 h1 v-1 h1 v-4 h1 v12 h1 v4 h1 v-3 h1 v-2 h1 v-4 h1 v6 h1 v-4 h1 v31 h1 v4 h1 v1 h1 v2 h1 v5 h1 v1 h1 v-7 h1 v-5 h1 v5 h1 v-1 h1 v7 h1 v0 h1 v3 h1 v2 h1 v-3 h1 v-1 h1 v0 h1 v6 h1 v-2 h1 v-1 h1 v-16 h1 v2 h1 v-2 h1 v4 h1 v-4 h1 v-3 h1 v-9 h1 v2 h1 v-17 h1 v7 h1 v-8 h1 v-17 h1 v1 h1 v-10 h1 v-13 h1 v-2 h1 v-22 h1 v-2 h1 v228Z"
          />
        </g>
        <g
          id="Pennsylvania-bars"
          transform="translate(350.16 132.07) scale(0.317076923076923 0.148808664259928)"
        >
          <path
            id="Pennsylvania-counts"
            d="M0,0 v-3 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-1 h1 v-7 h1 v-6 h1 v-5 h1 v-7 h1 v-2 h1 v-3 h1 v-10 h1 v3 h1 v-2 h1 v2 h1 v0 h1 v-11 h1 v-3 h1 v-1 h1 v0 h1 v2 h1 v1 h1 v-3 h1 v-1 h1 v-3 h1 v0 h1 v-8 h1 v-1 h1 v-8 h1 v-3 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v-6 h1 v-10 h1 v-13 h1 v-18 h1 v-11 h1 v0 h1 v-6 h1 v-3 h1 v0 h1 v1 h1 v-3 h1 v-10 h1 v-1 h1 v1 h1 v-1 h1 v2 h1 v3 h1 v-5 h1 v-1 h1 v-1 h1 v-3 h1 v6 h1 v0 h1 v-8 h1 v-6 h1 v-4 h1 v-8 h1 v-13 h1 v-18 h1 v-6 h1 v-8 h1 v-3 h1 v-2 h1 v1 h1 v-3 h1 v-5 h1 v-6 h1 v-11 h1 v-3 h1 v5 h1 v-2 h1 v20 h1 v3 h1 v19 h1 v-1 h1 v1 h1 v-1 h1 v-7 h1 v1 h1 v-5 h1 v-2 h1 v1 h1 v3 h1 v2 h1 v8 h1 v-4 h1 v1 h1 v12 h1 v11 h1 v-3 h1 v-4 h1 v9 h1 v-4 h1 v2 h1 v-4 h1 v-4 h1 v0 h1 v-5 h1 v-8 h1 v1 h1 v-8 h1 v-10 h1 v4 h1 v-10 h1 v-2 h1 v-12 h1 v-5 h1 v-2 h1 v-4 h1 v10 h1 v2 h1 v-10 h1 v275Z"
          />
        </g>
        <g
          id="New Jersey-bars"
          transform="translate(393.93 132.07) scale(0.317076923076923 0.31953488372093)"
        >
          <path
            id="New Jersey-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-7 h1 v0 h1 v1 h1 v3 h1 v0 h1 v2 h1 v0 h1 v0 h1 v2 h1 v-2 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v0 h1 v-16 h1 v-6 h1 v-5 h1 v0 h1 v-2 h1 v1 h1 v-2 h1 v-2 h1 v0 h1 v-2 h1 v-3 h1 v-5 h1 v-2 h1 v-6 h1 v-1 h1 v-1 h1 v-5 h1 v2 h1 v-4 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v-3 h1 v-2 h1 v-2 h1 v2 h1 v0 h1 v-3 h1 v4 h1 v-1 h1 v-1 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v-1 h1 v-2 h1 v-2 h1 v-3 h1 v0 h1 v-1 h1 v3 h1 v-6 h1 v1 h1 v2 h1 v1 h1 v5 h1 v-14 h1 v-2 h1 v-1 h1 v-3 h1 v0 h1 v-3 h1 v1 h1 v6 h1 v-1 h1 v1 h1 v2 h1 v5 h1 v3 h1 v-3 h1 v0 h1 v-9 h1 v0 h1 v2 h1 v5 h1 v1 h1 v2 h1 v2 h1 v-3 h1 v0 h1 v1 h1 v-3 h1 v-11 h1 v-5 h1 v2 h1 v-3 h1 v0 h1 v-8 h1 v2 h1 v-8 h1 v-6 h1 v-4 h1 v8 h1 v7 h1 v2 h1 v0 h1 v0 h1 v-3 h1 v115Z"
          />
        </g>
        <g
          id="Connecticut-bars"
          transform="translate(437.7 132.07) scale(0.317076923076923 0.44804347826087)"
        >
          <path
            id="Connecticut-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v-1 h1 v-7 h1 v-4 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-3 h1 v-2 h1 v0 h1 v-3 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v2 h1 v-4 h1 v-1 h1 v-6 h1 v2 h1 v-6 h1 v-8 h1 v-13 h1 v2 h1 v-1 h1 v-1 h1 v-10 h1 v-4 h1 v3 h1 v8 h1 v1 h1 v18 h1 v2 h1 v5 h1 v3 h1 v-2 h1 v8 h1 v-2 h1 v-2 h1 v1 h1 v1 h1 v6 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v1 h1 v-2 h1 v0 h1 v3 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-3 h1 v3 h1 v0 h1 v-5 h1 v0 h1 v-4 h1 v1 h1 v-2 h1 v0 h1 v1 h1 v-3 h1 v-4 h1 v-2 h1 v-3 h1 v-5 h1 v-1 h1 v1 h1 v3 h1 v0 h1 v-2 h1 v3 h1 v-1 h1 v-1 h1 v0 h1 v64Z"
          />
        </g>
        <g
          id="California-bars"
          transform="translate(21.885 175.84) scale(0.317076923076923 0.0454465270121279)"
        >
          <path
            id="California-counts"
            d="M0,0 v0 h1 v0 h1 v-2 h1 v0 h1 v-2 h1 v1 h1 v-5 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v0 h1 v-6 h1 v-4 h1 v-5 h1 v-7 h1 v-6 h1 v-4 h1 v-7 h1 v2 h1 v-8 h1 v-26 h1 v-58 h1 v-15 h1 v30 h1 v0 h1 v15 h1 v-19 h1 v-4 h1 v0 h1 v-2 h1 v-14 h1 v-25 h1 v-11 h1 v-9 h1 v-4 h1 v-13 h1 v-1 h1 v-26 h1 v-27 h1 v-35 h1 v-32 h1 v8 h1 v16 h1 v-1 h1 v10 h1 v-3 h1 v-9 h1 v11 h1 v-7 h1 v-41 h1 v-17 h1 v-1 h1 v-5 h1 v-18 h1 v-7 h1 v-5 h1 v-18 h1 v-17 h1 v-13 h1 v-14 h1 v-33 h1 v-30 h1 v-19 h1 v-11 h1 v-13 h1 v-5 h1 v-29 h1 v-55 h1 v-52 h1 v-30 h1 v-42 h1 v-22 h1 v-5 h1 v-24 h1 v-11 h1 v-28 h1 v-11 h1 v8 h1 v-13 h1 v-2 h1 v-17 h1 v6 h1 v7 h1 v22 h1 v-11 h1 v-1 h1 v6 h1 v4 h1 v42 h1 v8 h1 v1 h1 v47 h1 v31 h1 v25 h1 v-4 h1 v19 h1 v-30 h1 v-6 h1 v-14 h1 v-40 h1 v-7 h1 v19 h1 v28 h1 v-22 h1 v35 h1 v-14 h1 v11 h1 v-16 h1 v-27 h1 v-15 h1 v-23 h1 v8 h1 v5 h1 v-15 h1 v36 h1 v-9 h1 v-30 h1 v-2 h1 v9 h1 v-19 h1 v17 h1 v-16 h1 v18 h1 v-16 h1 v5 h1 v20 h1 v25 h1 v-21 h1 v19 h1 v792Z"
          />
        </g>
        <g
          id="Utah-bars"
          transform="translate(65.655 175.84) scale(0.317076923076923 0.148273381294964)"
        >
          <path
            id="Utah-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-3 h1 v-11 h1 v-1 h1 v-8 h1 v-1 h1 v-5 h1 v-10 h1 v-3 h1 v5 h1 v5 h1 v-6 h1 v5 h1 v0 h1 v-6 h1 v-3 h1 v3 h1 v0 h1 v1 h1 v2 h1 v-6 h1 v1 h1 v-3 h1 v1 h1 v0 h1 v-3 h1 v-2 h1 v1 h1 v-2 h1 v3 h1 v-7 h1 v-10 h1 v-13 h1 v-5 h1 v-3 h1 v-15 h1 v-13 h1 v-1 h1 v-5 h1 v-17 h1 v-6 h1 v-7 h1 v-28 h1 v-24 h1 v-7 h1 v3 h1 v-8 h1 v-5 h1 v42 h1 v-3 h1 v-13 h1 v13 h1 v-6 h1 v-17 h1 v7 h1 v4 h1 v-26 h1 v-29 h1 v-5 h1 v-2 h1 v6 h1 v27 h1 v0 h1 v13 h1 v-14 h1 v3 h1 v8 h1 v-17 h1 v3 h1 v-15 h1 v8 h1 v-10 h1 v-27 h1 v-5 h1 v65 h1 v6 h1 v6 h1 v12 h1 v-10 h1 v31 h1 v1 h1 v-5 h1 v4 h1 v5 h1 v2 h1 v1 h1 v4 h1 v12 h1 v9 h1 v6 h1 v1 h1 v-2 h1 v-2 h1 v-5 h1 v-1 h1 v-1 h1 v5 h1 v0 h1 v-3 h1 v6 h1 v1 h1 v0 h1 v-4 h1 v-3 h1 v-3 h1 v8 h1 v-1 h1 v-3 h1 v-2 h1 v2 h1 v0 h1 v-1 h1 v137Z"
          />
        </g>
        <g
          id="Colorado-bars"
          transform="translate(109.425 175.84) scale(0.317076923076923 0.0958604651162791)"
        >
          <path
            id="Colorado-counts"
            d="M0,0 v-1 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v-4 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v-2 h1 v-3 h1 v1 h1 v-19 h1 v4 h1 v8 h1 v-3 h1 v-1 h1 v-3 h1 v-33 h1 v-15 h1 v2 h1 v-11 h1 v-2 h1 v3 h1 v0 h1 v-5 h1 v8 h1 v2 h1 v4 h1 v-5 h1 v-9 h1 v-11 h1 v1 h1 v4 h1 v-3 h1 v-4 h1 v6 h1 v-14 h1 v1 h1 v-1 h1 v-1 h1 v-6 h1 v-5 h1 v-14 h1 v-13 h1 v-23 h1 v-13 h1 v-17 h1 v-13 h1 v-1 h1 v-27 h1 v-4 h1 v-13 h1 v-8 h1 v3 h1 v-5 h1 v-5 h1 v3 h1 v-12 h1 v-11 h1 v6 h1 v-2 h1 v6 h1 v11 h1 v1 h1 v-7 h1 v-4 h1 v-8 h1 v-1 h1 v0 h1 v-8 h1 v-14 h1 v-13 h1 v-1 h1 v-16 h1 v8 h1 v2 h1 v3 h1 v12 h1 v-5 h1 v3 h1 v0 h1 v-23 h1 v-20 h1 v-24 h1 v-3 h1 v-33 h1 v-4 h1 v22 h1 v39 h1 v29 h1 v26 h1 v-24 h1 v5 h1 v17 h1 v15 h1 v-8 h1 v6 h1 v2 h1 v-11 h1 v-2 h1 v8 h1 v-17 h1 v10 h1 v14 h1 v12 h1 v7 h1 v6 h1 v-2 h1 v-6 h1 v-6 h1 v7 h1 v7 h1 v1 h1 v0 h1 v21 h1 v5 h1 v0 h1 v5 h1 v1 h1 v-1 h1 v1 h1 v-2 h1 v-3 h1 v3 h1 v0 h1 v-4 h1 v247Z"
          />
        </g>
        <g
          id="Nebraska-bars"
          transform="translate(153.195 175.84) scale(0.317076923076923 0.243905325443787)"
        >
          <path
            id="Nebraska-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-8 h1 v-5 h1 v-7 h1 v-10 h1 v-3 h1 v0 h1 v-5 h1 v-3 h1 v-1 h1 v-8 h1 v-3 h1 v-1 h1 v-14 h1 v-7 h1 v5 h1 v-4 h1 v-4 h1 v-6 h1 v-11 h1 v-8 h1 v-14 h1 v-19 h1 v-8 h1 v-11 h1 v-8 h1 v8 h1 v-8 h1 v-4 h1 v10 h1 v-2 h1 v7 h1 v-4 h1 v0 h1 v-7 h1 v-1 h1 v0 h1 v8 h1 v5 h1 v-2 h1 v-1 h1 v-7 h1 v14 h1 v0 h1 v2 h1 v5 h1 v0 h1 v-2 h1 v5 h1 v1 h1 v-9 h1 v-8 h1 v3 h1 v1 h1 v5 h1 v-7 h1 v0 h1 v1 h1 v-1 h1 v2 h1 v-3 h1 v3 h1 v-3 h1 v1 h1 v26 h1 v2 h1 v11 h1 v28 h1 v4 h1 v-9 h1 v-1 h1 v7 h1 v0 h1 v0 h1 v-2 h1 v-7 h1 v1 h1 v4 h1 v-2 h1 v-1 h1 v-1 h1 v1 h1 v2 h1 v-4 h1 v2 h1 v0 h1 v-1 h1 v-5 h1 v0 h1 v-3 h1 v-9 h1 v1 h1 v109Z"
          />
        </g>
        <g
          id="Missouri-bars"
          transform="translate(196.965 175.84) scale(0.317076923076923 0.177672413793103)"
        >
          <path
            id="Missouri-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-21 h1 v-14 h1 v-4 h1 v-4 h1 v-3 h1 v-1 h1 v-4 h1 v-8 h1 v-4 h1 v0 h1 v-2 h1 v-4 h1 v2 h1 v-3 h1 v-3 h1 v-2 h1 v1 h1 v-3 h1 v-4 h1 v0 h1 v3 h1 v1 h1 v-1 h1 v-1 h1 v-4 h1 v0 h1 v-1 h1 v-17 h1 v-3 h1 v-5 h1 v1 h1 v0 h1 v-1 h1 v-3 h1 v-7 h1 v-3 h1 v-4 h1 v-3 h1 v3 h1 v-4 h1 v0 h1 v-5 h1 v0 h1 v-2 h1 v-12 h1 v-6 h1 v2 h1 v-2 h1 v4 h1 v3 h1 v7 h1 v13 h1 v0 h1 v0 h1 v10 h1 v7 h1 v3 h1 v-1 h1 v-1 h1 v-3 h1 v11 h1 v3 h1 v-1 h1 v4 h1 v1 h1 v0 h1 v-2 h1 v-4 h1 v3 h1 v6 h1 v3 h1 v0 h1 v-5 h1 v-2 h1 v-2 h1 v-6 h1 v-17 h1 v-4 h1 v-8 h1 v-11 h1 v-21 h1 v-1 h1 v-2 h1 v0 h1 v-7 h1 v-2 h1 v-22 h1 v-4 h1 v2 h1 v-1 h1 v-4 h1 v-2 h1 v-8 h1 v-2 h1 v-4 h1 v-4 h1 v-2 h1 v0 h1 v232Z"
          />
        </g>
        <g
          id="Kentucky-bars"
          transform="translate(240.735 175.84) scale(0.317076923076923 0.267662337662338)"
        >
          <path
            id="Kentucky-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v-9 h1 v2 h1 v1 h1 v3 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-4 h1 v0 h1 v-1 h1 v-9 h1 v-4 h1 v-4 h1 v24 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-4 h1 v-27 h1 v-15 h1 v-13 h1 v-6 h1 v0 h1 v1 h1 v-4 h1 v0 h1 v-1 h1 v1 h1 v-3 h1 v-2 h1 v-1 h1 v-4 h1 v-4 h1 v-3 h1 v-7 h1 v-2 h1 v-5 h1 v-5 h1 v0 h1 v0 h1 v-4 h1 v5 h1 v1 h1 v-1 h1 v-2 h1 v1 h1 v-1 h1 v-5 h1 v-7 h1 v0 h1 v-1 h1 v7 h1 v1 h1 v1 h1 v-4 h1 v14 h1 v3 h1 v2 h1 v5 h1 v-2 h1 v-3 h1 v3 h1 v2 h1 v10 h1 v5 h1 v-2 h1 v3 h1 v-3 h1 v-3 h1 v-11 h1 v-3 h1 v1 h1 v17 h1 v-5 h1 v18 h1 v0 h1 v-5 h1 v-10 h1 v-4 h1 v-15 h1 v3 h1 v-11 h1 v-8 h1 v2 h1 v4 h1 v4 h1 v0 h1 v-6 h1 v0 h1 v-5 h1 v-6 h1 v1 h1 v-8 h1 v-3 h1 v-1 h1 v4 h1 v-5 h1 v-5 h1 v-4 h1 v154Z"
          />
        </g>
        <g
          id="West Virginia-bars"
          transform="translate(284.505 175.84) scale(0.317076923076923 0.346386554621849)"
        >
          <path
            id="West Virginia-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v1 h1 v-2 h1 v-1 h1 v1 h1 v2 h1 v0 h1 v-4 h1 v-9 h1 v-5 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-16 h1 v18 h1 v8 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v-1 h1 v-4 h1 v-4 h1 v0 h1 v5 h1 v-2 h1 v-14 h1 v-14 h1 v-4 h1 v10 h1 v-1 h1 v0 h1 v-1 h1 v1 h1 v-2 h1 v-7 h1 v-9 h1 v-2 h1 v-12 h1 v-2 h1 v0 h1 v-3 h1 v-3 h1 v-7 h1 v-7 h1 v-1 h1 v1 h1 v0 h1 v2 h1 v2 h1 v4 h1 v0 h1 v1 h1 v-2 h1 v-2 h1 v0 h1 v3 h1 v-1 h1 v1 h1 v1 h1 v-2 h1 v3 h1 v-5 h1 v1 h1 v-5 h1 v-3 h1 v-3 h1 v-3 h1 v1 h1 v-3 h1 v0 h1 v2 h1 v-12 h1 v3 h1 v-5 h1 v14 h1 v-2 h1 v1 h1 v3 h1 v3 h1 v28 h1 v9 h1 v1 h1 v-10 h1 v-2 h1 v4 h1 v-4 h1 v1 h1 v0 h1 v0 h1 v3 h1 v8 h1 v3 h1 v3 h1 v-9 h1 v0 h1 v2 h1 v0 h1 v-3 h1 v0 h1 v-2 h1 v0 h1 v1 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v-5 h1 v0 h1 v-3 h1 v-6 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v2 h1 v84Z"
          />
        </g>
        <g
          id="Maryland-bars"
          transform="translate(328.275 175.84) scale(0.317076923076923 0.282328767123288)"
        >
          <path
            id="Maryland-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-1 h1 v-3 h1 v-8 h1 v-1 h1 v-2 h1 v-3 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v0 h1 v-2 h1 v-2 h1 v0 h1 v-8 h1 v-1 h1 v-1 h1 v-10 h1 v-13 h1 v-6 h1 v-5 h1 v-6 h1 v2 h1 v1 h1 v0 h1 v0 h1 v6 h1 v-6 h1 v7 h1 v-2 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v-1 h1 v-2 h1 v-9 h1 v-8 h1 v1 h1 v0 h1 v2 h1 v0 h1 v3 h1 v-1 h1 v4 h1 v2 h1 v-4 h1 v6 h1 v-1 h1 v1 h1 v-3 h1 v5 h1 v-1 h1 v-5 h1 v3 h1 v1 h1 v-2 h1 v2 h1 v2 h1 v4 h1 v-1 h1 v5 h1 v-4 h1 v2 h1 v-2 h1 v4 h1 v-10 h1 v0 h1 v-9 h1 v-8 h1 v-13 h1 v-5 h1 v3 h1 v0 h1 v-1 h1 v4 h1 v-10 h1 v-9 h1 v-5 h1 v2 h1 v-1 h1 v-1 h1 v-1 h1 v-8 h1 v1 h1 v3 h1 v-4 h1 v-2 h1 v2 h1 v144Z"
          />
        </g>
        <g
          id="Delaware-bars"
          transform="translate(372.045 175.84) scale(0.317076923076923 1.79217391304348)"
        >
          <path
            id="Delaware-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v2 h1 v0 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-2 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v1 h1 v3 h1 v2 h1 v1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-1 h1 v-2 h1 v0 h1 v2 h1 v1 h1 v-1 h1 v-1 h1 v-4 h1 v5 h1 v-6 h1 v-1 h1 v0 h1 v-1 h1 v7 h1 v1 h1 v0 h1 v-5 h1 v5 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v2 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v18Z"
          />
        </g>
        <g
          id="District of Columbia-bars"
          transform="translate(415.815 175.84) scale(0.317076923076923 10.305)"
        >
          <path
            id="District of Columbia-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v-1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v4Z"
          />
        </g>
        <g
          id="Arizona-bars"
          transform="translate(65.655 219.61) scale(0.317076923076923 0.203054187192118)"
        >
          <path
            id="Arizona-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v-1 h1 v-4 h1 v-3 h1 v4 h1 v1 h1 v0 h1 v2 h1 v0 h1 v-2 h1 v-2 h1 v-12 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v2 h1 v0 h1 v-2 h1 v-1 h1 v-2 h1 v-1 h1 v6 h1 v-2 h1 v-2 h1 v-2 h1 v-10 h1 v-5 h1 v-3 h1 v-1 h1 v16 h1 v-2 h1 v-15 h1 v1 h1 v0 h1 v-3 h1 v-3 h1 v-9 h1 v-4 h1 v1 h1 v-2 h1 v-7 h1 v3 h1 v11 h1 v-1 h1 v-6 h1 v-1 h1 v-7 h1 v-3 h1 v-3 h1 v-5 h1 v-2 h1 v-5 h1 v-5 h1 v-10 h1 v6 h1 v-8 h1 v-2 h1 v-11 h1 v-2 h1 v-7 h1 v-2 h1 v-8 h1 v-21 h1 v-13 h1 v-1 h1 v-6 h1 v3 h1 v1 h1 v16 h1 v0 h1 v1 h1 v-3 h1 v4 h1 v-2 h1 v10 h1 v-21 h1 v10 h1 v2 h1 v18 h1 v1 h1 v-2 h1 v1 h1 v6 h1 v-1 h1 v-3 h1 v-5 h1 v-10 h1 v-2 h1 v14 h1 v-3 h1 v-2 h1 v-15 h1 v-1 h1 v3 h1 v-4 h1 v-1 h1 v-11 h1 v4 h1 v-6 h1 v-2 h1 v20 h1 v-27 h1 v0 h1 v-1 h1 v-9 h1 v1 h1 v-1 h1 v-7 h1 v4 h1 v7 h1 v2 h1 v-4 h1 v10 h1 v-5 h1 v-4 h1 v193Z"
          />
        </g>
        <g
          id="New Mexico-bars"
          transform="translate(109.425 219.61) scale(0.317076923076923 0.234204545454545)"
        >
          <path
            id="New Mexico-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v-3 h1 v-1 h1 v2 h1 v-1 h1 v0 h1 v-1 h1 v-8 h1 v-4 h1 v4 h1 v2 h1 v-6 h1 v1 h1 v3 h1 v-4 h1 v5 h1 v-3 h1 v4 h1 v-3 h1 v-1 h1 v7 h1 v-7 h1 v-9 h1 v3 h1 v-2 h1 v-18 h1 v-6 h1 v-1 h1 v0 h1 v-4 h1 v-2 h1 v-14 h1 v-4 h1 v-3 h1 v-8 h1 v-1 h1 v3 h1 v-3 h1 v-8 h1 v-3 h1 v-3 h1 v-2 h1 v-2 h1 v0 h1 v-4 h1 v4 h1 v-5 h1 v-4 h1 v-4 h1 v-4 h1 v5 h1 v-10 h1 v-3 h1 v-6 h1 v-3 h1 v-7 h1 v-2 h1 v-7 h1 v-20 h1 v-2 h1 v0 h1 v4 h1 v2 h1 v6 h1 v-4 h1 v3 h1 v8 h1 v5 h1 v7 h1 v-3 h1 v-4 h1 v-1 h1 v-12 h1 v4 h1 v-3 h1 v2 h1 v-1 h1 v13 h1 v1 h1 v-2 h1 v3 h1 v7 h1 v0 h1 v1 h1 v-3 h1 v4 h1 v-2 h1 v-2 h1 v-7 h1 v10 h1 v5 h1 v8 h1 v-2 h1 v-2 h1 v3 h1 v-11 h1 v-5 h1 v1 h1 v-3 h1 v14 h1 v-9 h1 v-2 h1 v-3 h1 v0 h1 v2 h1 v1 h1 v3 h1 v1 h1 v1 h1 v3 h1 v-3 h1 v2 h1 v-11 h1 v1 h1 v146Z"
          />
        </g>
        <g
          id="Kansas-bars"
          transform="translate(153.195 219.61) scale(0.317076923076923 0.225245901639344)"
        >
          <path
            id="Kansas-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-6 h1 v1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v3 h1 v-1 h1 v5 h1 v3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-6 h1 v-5 h1 v-6 h1 v0 h1 v-5 h1 v-9 h1 v0 h1 v5 h1 v0 h1 v2 h1 v-2 h1 v-7 h1 v-12 h1 v0 h1 v8 h1 v1 h1 v0 h1 v-4 h1 v-1 h1 v-2 h1 v5 h1 v-12 h1 v-10 h1 v0 h1 v0 h1 v-4 h1 v0 h1 v-3 h1 v-5 h1 v-7 h1 v-3 h1 v-1 h1 v-4 h1 v-6 h1 v-3 h1 v-1 h1 v7 h1 v-10 h1 v-1 h1 v0 h1 v0 h1 v-3 h1 v-13 h1 v0 h1 v-9 h1 v-11 h1 v-7 h1 v-8 h1 v1 h1 v-4 h1 v-4 h1 v1 h1 v-1 h1 v7 h1 v3 h1 v3 h1 v-2 h1 v1 h1 v-1 h1 v-1 h1 v2 h1 v-5 h1 v-4 h1 v1 h1 v8 h1 v6 h1 v1 h1 v-2 h1 v4 h1 v4 h1 v0 h1 v-2 h1 v1 h1 v0 h1 v0 h1 v-8 h1 v-5 h1 v-2 h1 v-3 h1 v5 h1 v-4 h1 v6 h1 v0 h1 v2 h1 v-1 h1 v-6 h1 v-4 h1 v-2 h1 v3 h1 v7 h1 v0 h1 v-1 h1 v-9 h1 v4 h1 v-6 h1 v-4 h1 v2 h1 v-11 h1 v-5 h1 v-5 h1 v-1 h1 v0 h1 v183Z"
          />
        </g>
        <g
          id="Arkansas-bars"
          transform="translate(196.965 219.61) scale(0.317076923076923 0.309924812030075)"
        >
          <path
            id="Arkansas-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-10 h1 v-3 h1 v-2 h1 v1 h1 v0 h1 v2 h1 v-3 h1 v-4 h1 v-6 h1 v-6 h1 v-6 h1 v-12 h1 v-2 h1 v-1 h1 v4 h1 v0 h1 v0 h1 v-3 h1 v-3 h1 v-2 h1 v0 h1 v-4 h1 v-5 h1 v-1 h1 v-3 h1 v0 h1 v-5 h1 v0 h1 v-1 h1 v-2 h1 v0 h1 v0 h1 v-3 h1 v-4 h1 v-1 h1 v-2 h1 v-1 h1 v1 h1 v-2 h1 v-2 h1 v1 h1 v7 h1 v12 h1 v1 h1 v2 h1 v1 h1 v0 h1 v5 h1 v0 h1 v12 h1 v0 h1 v0 h1 v6 h1 v3 h1 v2 h1 v0 h1 v4 h1 v-2 h1 v3 h1 v-5 h1 v-3 h1 v-4 h1 v-5 h1 v3 h1 v-2 h1 v0 h1 v12 h1 v-2 h1 v-7 h1 v-5 h1 v-8 h1 v-9 h1 v-7 h1 v-13 h1 v-4 h1 v3 h1 v2 h1 v-9 h1 v3 h1 v-7 h1 v-5 h1 v-8 h1 v10 h1 v-7 h1 v-5 h1 v-7 h1 v1 h1 v4 h1 v0 h1 v-6 h1 v-1 h1 v133Z"
          />
        </g>
        <g
          id="Tennessee-bars"
          transform="translate(240.735 219.61) scale(0.317076923076923 0.272980132450331)"
        >
          <path
            id="Tennessee-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-4 h1 v1 h1 v0 h1 v-5 h1 v-3 h1 v1 h1 v0 h1 v2 h1 v2 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v0 h1 v0 h1 v0 h1 v2 h1 v0 h1 v-2 h1 v-9 h1 v-11 h1 v-2 h1 v-5 h1 v0 h1 v0 h1 v-11 h1 v0 h1 v-5 h1 v-1 h1 v-12 h1 v-6 h1 v-1 h1 v-16 h1 v12 h1 v-14 h1 v-2 h1 v-2 h1 v-1 h1 v-1 h1 v-5 h1 v-7 h1 v-1 h1 v0 h1 v0 h1 v-4 h1 v-3 h1 v-2 h1 v-3 h1 v4 h1 v0 h1 v-3 h1 v-4 h1 v0 h1 v-11 h1 v-5 h1 v-2 h1 v4 h1 v1 h1 v12 h1 v7 h1 v-5 h1 v9 h1 v1 h1 v-3 h1 v-7 h1 v-1 h1 v-21 h1 v-2 h1 v18 h1 v3 h1 v8 h1 v6 h1 v-1 h1 v6 h1 v6 h1 v-6 h1 v-6 h1 v5 h1 v-4 h1 v-1 h1 v1 h1 v21 h1 v-1 h1 v9 h1 v3 h1 v-5 h1 v-7 h1 v12 h1 v-4 h1 v4 h1 v0 h1 v17 h1 v-4 h1 v5 h1 v9 h1 v4 h1 v-6 h1 v-2 h1 v-8 h1 v-4 h1 v-3 h1 v-13 h1 v-4 h1 v-6 h1 v0 h1 v8 h1 v-4 h1 v-3 h1 v4 h1 v2 h1 v0 h1 v1 h1 v-2 h1 v-7 h1 v1 h1 v-4 h1 v10 h1 v-14 h1 v0 h1 v107Z"
          />
        </g>
        <g
          id="Virginia-bars"
          transform="translate(284.505 219.61) scale(0.317076923076923 0.211384615384615)"
        >
          <path
            id="Virginia-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v3 h1 v0 h1 v-4 h1 v-5 h1 v0 h1 v0 h1 v-1 h1 v2 h1 v-1 h1 v-1 h1 v2 h1 v5 h1 v0 h1 v0 h1 v0 h1 v-7 h1 v-1 h1 v0 h1 v0 h1 v-1 h1 v-16 h1 v-11 h1 v-10 h1 v-7 h1 v-12 h1 v-6 h1 v-1 h1 v0 h1 v3 h1 v0 h1 v-1 h1 v-3 h1 v-1 h1 v-4 h1 v-4 h1 v-1 h1 v-6 h1 v-14 h1 v-12 h1 v-9 h1 v-3 h1 v-7 h1 v-6 h1 v-7 h1 v-6 h1 v-7 h1 v-7 h1 v2 h1 v-1 h1 v-2 h1 v1 h1 v15 h1 v0 h1 v-1 h1 v6 h1 v1 h1 v-1 h1 v-1 h1 v-3 h1 v-1 h1 v-4 h1 v-4 h1 v-3 h1 v3 h1 v-2 h1 v-2 h1 v-1 h1 v0 h1 v-4 h1 v-6 h1 v-2 h1 v-4 h1 v3 h1 v-1 h1 v-10 h1 v-2 h1 v10 h1 v4 h1 v2 h1 v1 h1 v-1 h1 v17 h1 v3 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v2 h1 v-3 h1 v4 h1 v7 h1 v1 h1 v8 h1 v-1 h1 v1 h1 v-2 h1 v-14 h1 v-5 h1 v3 h1 v-3 h1 v-4 h1 v-1 h1 v-10 h1 v-1 h1 v7 h1 v-1 h1 v3 h1 v-6 h1 v-3 h1 v0 h1 v-8 h1 v-4 h1 v-3 h1 v1 h1 v194Z"
          />
        </g>
        <g
          id="North Carolina-bars"
          transform="translate(328.275 219.61) scale(0.317076923076923 0.1815859030837)"
        >
          <path
            id="North Carolina-counts"
            d="M0,0 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-2 h1 v-2 h1 v0 h1 v1 h1 v1 h1 v-1 h1 v0 h1 v-1 h1 v-4 h1 v1 h1 v-1 h1 v-4 h1 v4 h1 v4 h1 v0 h1 v1 h1 v-5 h1 v0 h1 v-2 h1 v0 h1 v3 h1 v3 h1 v1 h1 v-3 h1 v-8 h1 v-3 h1 v-2 h1 v-3 h1 v-9 h1 v-7 h1 v2 h1 v-5 h1 v-16 h1 v-3 h1 v-6 h1 v3 h1 v-1 h1 v-1 h1 v-18 h1 v-5 h1 v0 h1 v-2 h1 v-5 h1 v-8 h1 v-9 h1 v1 h1 v-13 h1 v3 h1 v-2 h1 v1 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v-5 h1 v-6 h1 v3 h1 v-2 h1 v-2 h1 v9 h1 v-3 h1 v-2 h1 v1 h1 v0 h1 v-3 h1 v-3 h1 v-5 h1 v-4 h1 v-18 h1 v-4 h1 v-3 h1 v1 h1 v-4 h1 v0 h1 v2 h1 v15 h1 v0 h1 v10 h1 v-4 h1 v7 h1 v-3 h1 v0 h1 v-6 h1 v-1 h1 v-1 h1 v13 h1 v-1 h1 v-4 h1 v-3 h1 v-7 h1 v-11 h1 v-5 h1 v-4 h1 v5 h1 v15 h1 v1 h1 v1 h1 v-6 h1 v-9 h1 v2 h1 v-8 h1 v0 h1 v-8 h1 v-15 h1 v-7 h1 v4 h1 v-6 h1 v-1 h1 v-2 h1 v-2 h1 v-1 h1 v-1 h1 v-7 h1 v-4 h1 v9 h1 v-5 h1 v4 h1 v-1 h1 v-2 h1 v4 h1 v1 h1 v-1 h1 v-5 h1 v223Z"
          />
        </g>
        <g
          id="South Carolina-bars"
          transform="translate(372.045 219.61) scale(0.317076923076923 0.327142857142857)"
        >
          <path
            id="South Carolina-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-2 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-1 h1 v-8 h1 v-3 h1 v1 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-9 h1 v-5 h1 v1 h1 v-6 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v-6 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v2 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v1 h1 v2 h1 v-8 h1 v1 h1 v-2 h1 v2 h1 v0 h1 v7 h1 v-6 h1 v-3 h1 v-4 h1 v0 h1 v-2 h1 v-3 h1 v1 h1 v0 h1 v-12 h1 v5 h1 v3 h1 v2 h1 v-18 h1 v-2 h1 v-3 h1 v-1 h1 v-4 h1 v-10 h1 v-1 h1 v-8 h1 v5 h1 v-16 h1 v7 h1 v-7 h1 v21 h1 v6 h1 v-11 h1 v0 h1 v8 h1 v-14 h1 v24 h1 v15 h1 v-3 h1 v-2 h1 v-5 h1 v-3 h1 v-5 h1 v5 h1 v-3 h1 v-2 h1 v3 h1 v3 h1 v-3 h1 v-1 h1 v-1 h1 v-8 h1 v0 h1 v102Z"
          />
        </g>
        <g
          id="Oklahoma-bars"
          transform="translate(131.31 263.38) scale(0.317076923076923 0.282328767123288)"
        >
          <path
            id="Oklahoma-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v-1 h1 v-5 h1 v2 h1 v6 h1 v1 h1 v0 h1 v0 h1 v1 h1 v-2 h1 v0 h1 v1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-4 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-3 h1 v-2 h1 v2 h1 v0 h1 v0 h1 v-4 h1 v-7 h1 v-4 h1 v-19 h1 v-13 h1 v-9 h1 v-2 h1 v0 h1 v-4 h1 v-3 h1 v-7 h1 v0 h1 v-1 h1 v-3 h1 v-3 h1 v-3 h1 v2 h1 v-7 h1 v-9 h1 v2 h1 v0 h1 v-7 h1 v-1 h1 v0 h1 v3 h1 v-10 h1 v-4 h1 v-7 h1 v5 h1 v8 h1 v-2 h1 v-6 h1 v-4 h1 v5 h1 v-3 h1 v-7 h1 v16 h1 v4 h1 v3 h1 v-4 h1 v-1 h1 v2 h1 v4 h1 v-4 h1 v-15 h1 v0 h1 v1 h1 v11 h1 v3 h1 v-2 h1 v-2 h1 v-1 h1 v1 h1 v-3 h1 v-7 h1 v1 h1 v6 h1 v-7 h1 v-4 h1 v19 h1 v2 h1 v-4 h1 v-7 h1 v0 h1 v-3 h1 v-3 h1 v-3 h1 v-1 h1 v1 h1 v-2 h1 v1 h1 v-1 h1 v-2 h1 v1 h1 v0 h1 v-1 h1 v2 h1 v1 h1 v0 h1 v-4 h1 v-1 h1 v-4 h1 v-5 h1 v0 h1 v-1 h1 v146Z"
          />
        </g>
        <g
          id="Louisiana-bars"
          transform="translate(175.08 263.38) scale(0.317076923076923 0.4122)"
        >
          <path
            id="Louisiana-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-3 h1 v0 h1 v3 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v-1 h1 v1 h1 v2 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v-3 h1 v-1 h1 v-13 h1 v-7 h1 v-7 h1 v0 h1 v-8 h1 v-4 h1 v-3 h1 v-2 h1 v-1 h1 v0 h1 v-7 h1 v-7 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v-1 h1 v-11 h1 v-6 h1 v2 h1 v-2 h1 v-1 h1 v-11 h1 v0 h1 v-1 h1 v-1 h1 v5 h1 v2 h1 v8 h1 v1 h1 v15 h1 v-4 h1 v9 h1 v0 h1 v-3 h1 v3 h1 v-3 h1 v2 h1 v0 h1 v2 h1 v-2 h1 v1 h1 v-8 h1 v2 h1 v4 h1 v-1 h1 v8 h1 v3 h1 v5 h1 v-1 h1 v2 h1 v-2 h1 v2 h1 v1 h1 v9 h1 v-3 h1 v-4 h1 v7 h1 v-4 h1 v-1 h1 v-4 h1 v-1 h1 v0 h1 v-4 h1 v-7 h1 v-1 h1 v1 h1 v6 h1 v1 h1 v1 h1 v0 h1 v-3 h1 v-2 h1 v-4 h1 v2 h1 v1 h1 v1 h1 v11 h1 v-1 h1 v-5 h1 v3 h1 v50Z"
          />
        </g>
        <g
          id="Mississippi-bars"
          transform="translate(218.85 263.38) scale(0.317076923076923 0.424948453608247)"
        >
          <path
            id="Mississippi-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v-1 h1 v1 h1 v5 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-12 h1 v0 h1 v0 h1 v2 h1 v-1 h1 v0 h1 v0 h1 v-2 h1 v-3 h1 v-4 h1 v-16 h1 v-15 h1 v1 h1 v-3 h1 v8 h1 v-5 h1 v-6 h1 v-1 h1 v5 h1 v-1 h1 v1 h1 v1 h1 v-1 h1 v-2 h1 v-1 h1 v2 h1 v1 h1 v0 h1 v-1 h1 v-1 h1 v1 h1 v1 h1 v-3 h1 v-5 h1 v0 h1 v-2 h1 v-1 h1 v-5 h1 v-2 h1 v3 h1 v6 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v-3 h1 v-5 h1 v-5 h1 v1 h1 v1 h1 v0 h1 v0 h1 v7 h1 v0 h1 v3 h1 v-1 h1 v-2 h1 v-4 h1 v-2 h1 v-4 h1 v4 h1 v8 h1 v-10 h1 v0 h1 v-3 h1 v-3 h1 v4 h1 v-4 h1 v-7 h1 v0 h1 v-4 h1 v-6 h1 v1 h1 v4 h1 v-1 h1 v7 h1 v7 h1 v1 h1 v-2 h1 v-1 h1 v-1 h1 v5 h1 v-2 h1 v8 h1 v-1 h1 v1 h1 v2 h1 v3 h1 v-1 h1 v-10 h1 v2 h1 v75Z"
          />
        </g>
        <g
          id="Alabama-bars"
          transform="translate(262.62 263.38) scale(0.317076923076923 0.307611940298507)"
        >
          <path
            id="Alabama-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-5 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v2 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v1 h1 v3 h1 v0 h1 v1 h1 v0 h1 v0 h1 v2 h1 v0 h1 v0 h1 v-7 h1 v-2 h1 v-1 h1 v5 h1 v-3 h1 v2 h1 v-12 h1 v-4 h1 v-4 h1 v8 h1 v-2 h1 v-1 h1 v0 h1 v-7 h1 v0 h1 v-7 h1 v-12 h1 v-16 h1 v1 h1 v-3 h1 v0 h1 v-6 h1 v-7 h1 v-2 h1 v1 h1 v0 h1 v0 h1 v1 h1 v2 h1 v-3 h1 v-11 h1 v1 h1 v0 h1 v1 h1 v-11 h1 v-3 h1 v-5 h1 v-10 h1 v3 h1 v0 h1 v-1 h1 v-3 h1 v2 h1 v10 h1 v1 h1 v11 h1 v4 h1 v3 h1 v21 h1 v14 h1 v0 h1 v2 h1 v-11 h1 v-11 h1 v-12 h1 v4 h1 v-6 h1 v6 h1 v-7 h1 v11 h1 v2 h1 v2 h1 v1 h1 v1 h1 v-3 h1 v-4 h1 v-10 h1 v-1 h1 v-9 h1 v8 h1 v-4 h1 v-2 h1 v2 h1 v-4 h1 v-5 h1 v0 h1 v-9 h1 v-2 h1 v-1 h1 v-2 h1 v-6 h1 v4 h1 v-1 h1 v-1 h1 v9 h1 v-1 h1 v-3 h1 v-3 h1 v-3 h1 v4 h1 v0 h1 v3 h1 v-4 h1 v-1 h1 v0 h1 v-12 h1 v1 h1 v133Z"
          />
        </g>
        <g
          id="Georgia-bars"
          transform="translate(306.39 263.38) scale(0.317076923076923 0.140204081632653)"
        >
          <path
            id="Georgia-counts"
            d="M0,0 v-1 h1 v0 h1 v1 h1 v0 h1 v-2 h1 v0 h1 v-1 h1 v-5 h1 v-3 h1 v-1 h1 v-1 h1 v-1 h1 v-4 h1 v3 h1 v-3 h1 v-7 h1 v1 h1 v0 h1 v1 h1 v4 h1 v2 h1 v0 h1 v-2 h1 v5 h1 v-1 h1 v0 h1 v2 h1 v-2 h1 v0 h1 v-2 h1 v-2 h1 v6 h1 v3 h1 v1 h1 v1 h1 v0 h1 v-3 h1 v-1 h1 v-1 h1 v-13 h1 v-10 h1 v-2 h1 v15 h1 v0 h1 v1 h1 v0 h1 v0 h1 v-5 h1 v-32 h1 v-6 h1 v-13 h1 v-7 h1 v0 h1 v-12 h1 v-6 h1 v-6 h1 v3 h1 v1 h1 v4 h1 v0 h1 v5 h1 v3 h1 v-4 h1 v1 h1 v-3 h1 v-6 h1 v3 h1 v-7 h1 v-2 h1 v-6 h1 v-1 h1 v-3 h1 v-2 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v12 h1 v8 h1 v18 h1 v0 h1 v2 h1 v-1 h1 v-4 h1 v1 h1 v-3 h1 v2 h1 v-2 h1 v-4 h1 v0 h1 v2 h1 v-1 h1 v-3 h1 v2 h1 v-8 h1 v-1 h1 v-5 h1 v0 h1 v2 h1 v2 h1 v1 h1 v-5 h1 v-3 h1 v-7 h1 v4 h1 v8 h1 v-8 h1 v0 h1 v-3 h1 v-20 h1 v-6 h1 v-17 h1 v1 h1 v-24 h1 v9 h1 v-19 h1 v-17 h1 v-20 h1 v-39 h1 v3 h1 v-5 h1 v5 h1 v-19 h1 v5 h1 v-1 h1 v-5 h1 v5 h1 v289Z"
          />
        </g>
        <g
          id="Texas-bars"
          transform="translate(131.31 307.15) scale(0.317076923076923 0.0801945525291829)"
        >
          <path
            id="Texas-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v0 h1 v0 h1 v0 h1 v-4 h1 v0 h1 v-1 h1 v3 h1 v-3 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-14 h1 v-7 h1 v-2 h1 v0 h1 v4 h1 v-3 h1 v-2 h1 v-7 h1 v-16 h1 v-52 h1 v17 h1 v1 h1 v6 h1 v1 h1 v4 h1 v-10 h1 v-1 h1 v-5 h1 v6 h1 v3 h1 v1 h1 v-2 h1 v-1 h1 v-13 h1 v-60 h1 v3 h1 v-4 h1 v-7 h1 v-5 h1 v-4 h1 v-2 h1 v-3 h1 v-17 h1 v0 h1 v-3 h1 v-2 h1 v-1 h1 v-18 h1 v-2 h1 v3 h1 v-2 h1 v-8 h1 v4 h1 v-11 h1 v-9 h1 v-22 h1 v-11 h1 v-27 h1 v-26 h1 v-13 h1 v-10 h1 v-7 h1 v-22 h1 v-25 h1 v-14 h1 v-11 h1 v-4 h1 v2 h1 v14 h1 v-9 h1 v-4 h1 v19 h1 v6 h1 v-6 h1 v11 h1 v14 h1 v9 h1 v4 h1 v7 h1 v-7 h1 v17 h1 v23 h1 v9 h1 v2 h1 v19 h1 v3 h1 v11 h1 v9 h1 v2 h1 v-4 h1 v18 h1 v-10 h1 v-18 h1 v-5 h1 v0 h1 v-5 h1 v-35 h1 v-21 h1 v-1 h1 v-5 h1 v-4 h1 v-8 h1 v-28 h1 v-13 h1 v-7 h1 v-10 h1 v-3 h1 v-3 h1 v-6 h1 v-8 h1 v-21 h1 v-10 h1 v-21 h1 v-1 h1 v514Z"
          />
        </g>
        <g
          id="Florida-bars"
          transform="translate(350.16 307.15) scale(0.317076923076923 0.0913968957871397)"
        >
          <path
            id="Florida-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v-3 h1 v-4 h1 v-1 h1 v0 h1 v-10 h1 v-8 h1 v-5 h1 v-2 h1 v-1 h1 v-3 h1 v-2 h1 v1 h1 v-4 h1 v-14 h1 v-5 h1 v0 h1 v-4 h1 v-3 h1 v0 h1 v-2 h1 v-13 h1 v-3 h1 v-1 h1 v-3 h1 v-16 h1 v-4 h1 v2 h1 v-2 h1 v0 h1 v-9 h1 v-5 h1 v-17 h1 v-5 h1 v-6 h1 v-4 h1 v0 h1 v-3 h1 v-21 h1 v-18 h1 v4 h1 v-10 h1 v11 h1 v2 h1 v3 h1 v-12 h1 v7 h1 v-3 h1 v-10 h1 v-7 h1 v-1 h1 v-12 h1 v-7 h1 v-2 h1 v-1 h1 v-13 h1 v-1 h1 v5 h1 v-6 h1 v-10 h1 v-6 h1 v-14 h1 v-22 h1 v-1 h1 v14 h1 v3 h1 v4 h1 v-4 h1 v-5 h1 v12 h1 v-30 h1 v-11 h1 v-6 h1 v5 h1 v-25 h1 v-14 h1 v1 h1 v-2 h1 v-19 h1 v8 h1 v-36 h1 v-5 h1 v-32 h1 v-3 h1 v31 h1 v4 h1 v18 h1 v1 h1 v12 h1 v-3 h1 v-22 h1 v10 h1 v2 h1 v-4 h1 v402Z"
          />
        </g>
        <g
          id="Alaska-bars"
          transform="translate(0 350.92) scale(0.317076923076923 0.340661157024793)"
        >
          <path
            id="Alaska-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v-2 h1 v0 h1 v-9 h1 v-4 h1 v0 h1 v0 h1 v1 h1 v1 h1 v1 h1 v0 h1 v-1 h1 v1 h1 v5 h1 v-1 h1 v-3 h1 v0 h1 v0 h1 v-1 h1 v-1 h1 v3 h1 v2 h1 v0 h1 v1 h1 v0 h1 v1 h1 v2 h1 v0 h1 v1 h1 v1 h1 v0 h1 v1 h1 v-1 h1 v-1 h1 v-7 h1 v-13 h1 v-5 h1 v-17 h1 v-3 h1 v-13 h1 v3 h1 v-2 h1 v3 h1 v-4 h1 v2 h1 v-3 h1 v-1 h1 v-4 h1 v-6 h1 v0 h1 v-8 h1 v-11 h1 v-2 h1 v-17 h1 v-3 h1 v-2 h1 v-1 h1 v3 h1 v-6 h1 v-1 h1 v3 h1 v16 h1 v-2 h1 v2 h1 v-1 h1 v-8 h1 v8 h1 v-3 h1 v-4 h1 v9 h1 v2 h1 v-2 h1 v5 h1 v14 h1 v10 h1 v2 h1 v2 h1 v-6 h1 v0 h1 v-16 h1 v9 h1 v13 h1 v3 h1 v4 h1 v2 h1 v-13 h1 v-13 h1 v-9 h1 v1 h1 v-7 h1 v-3 h1 v8 h1 v-3 h1 v3 h1 v3 h1 v0 h1 v-2 h1 v-6 h1 v-7 h1 v0 h1 v11 h1 v-1 h1 v4 h1 v9 h1 v0 h1 v-1 h1 v-2 h1 v87Z"
          />
        </g>
        <g
          id="Hawaii-bars"
          transform="translate(43.77 350.92) scale(0.317076923076923 0.224021739130435)"
        >
          <path
            id="Hawaii-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v1 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-2 h1 v-1 h1 v-2 h1 v-9 h1 v-17 h1 v-7 h1 v-14 h1 v-12 h1 v12 h1 v7 h1 v6 h1 v-10 h1 v-10 h1 v1 h1 v-3 h1 v-9 h1 v0 h1 v9 h1 v-10 h1 v-2 h1 v-3 h1 v0 h1 v5 h1 v-5 h1 v-5 h1 v-22 h1 v4 h1 v7 h1 v1 h1 v-4 h1 v-9 h1 v-2 h1 v-9 h1 v-5 h1 v-2 h1 v3 h1 v0 h1 v0 h1 v0 h1 v6 h1 v-2 h1 v-2 h1 v1 h1 v-3 h1 v0 h1 v-6 h1 v-7 h1 v0 h1 v2 h1 v2 h1 v6 h1 v-12 h1 v0 h1 v-10 h1 v6 h1 v-5 h1 v-17 h1 v-14 h1 v-1 h1 v3 h1 v-12 h1 v15 h1 v4 h1 v12 h1 v20 h1 v20 h1 v3 h1 v-2 h1 v-2 h1 v1 h1 v1 h1 v2 h1 v8 h1 v-3 h1 v1 h1 v10 h1 v-1 h1 v-2 h1 v13 h1 v0 h1 v3 h1 v-2 h1 v1 h1 v-1 h1 v-2 h1 v-1 h1 v-1 h1 v-3 h1 v7 h1 v5 h1 v5 h1 v0 h1 v1 h1 v1 h1 v-4 h1 v5 h1 v4 h1 v6 h1 v5 h1 v-1 h1 v-2 h1 v2 h1 v-2 h1 v4 h1 v3 h1 v-5 h1 v-3 h1 v3 h1 v-1 h1 v-5 h1 v0 h1 v-3 h1 v65Z"
          />
        </g>
        <g
          id="Puerto Rico-bars"
          transform="translate(437.7 350.92) scale(0.317076923076923 0.438510638297872)"
        >
          <path
            id="Puerto Rico-counts"
            d="M0,0 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v0 h1 v-1 h1 v0 h1 v-2 h1 v-3 h1 v-1 h1 v1 h1 v-4 h1 v0 h1 v1 h1 v2 h1 v2 h1 v1 h1 v0 h1 v-1 h1 v2 h1 v1 h1 v-3 h1 v-9 h1 v-5 h1 v1 h1 v-1 h1 v-3 h1 v-1 h1 v-5 h1 v-4 h1 v1 h1 v-19 h1 v16 h1 v-3 h1 v-2 h1 v5 h1 v3 h1 v-1 h1 v-1 h1 v-1 h1 v0 h1 v-2 h1 v0 h1 v-2 h1 v1 h1 v-1 h1 v-5 h1 v1 h1 v0 h1 v-4 h1 v-7 h1 v-2 h1 v-9 h1 v-7 h1 v-6 h1 v4 h1 v0 h1 v0 h1 v2 h1 v-3 h1 v2 h1 v-2 h1 v-7 h1 v-3 h1 v3 h1 v-1 h1 v-2 h1 v-3 h1 v6 h1 v-1 h1 v3 h1 v-1 h1 v3 h1 v1 h1 v-2 h1 v2 h1 v-1 h1 v3 h1 v-15 h1 v0 h1 v-5 h1 v94Z"
          />
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
            <clipPath id="tip-clip">
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
      </svg>
      <!-- <cartogram /> -->
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
/* import cartogram from "../assets/cartogram/cartogram_init_tooltip.svg"; */
import GeorgiaInsetMap from './georgiaInsetMap';
import atlantaSliderText from "../assets/mapboxSlider/atlantaSliderText";
export default {
    'name': 'MapImageSlider',
    components:{
          GeorgiaInsetMap
    },
    data(){
        return{
            atlantaText: atlantaSliderText.textContents
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
#cartoUSA {
  width:120%;
  height: auto;
}
@media screen and (min-width: 600px){
    .beer-slider[data-beer-label]:after,
    .beer-reveal[data-beer-label]:after{
        font-size: 1.5em;
    }
}
</style>