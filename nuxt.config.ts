export default defineNuxtConfig({
  compatibilityDate: '2025-05-09',
  future: {
    compatibilityVersion: 4,
  },
  experimental: {
    scanPageMeta: 'after-resolve',
    sharedPrerenderData: false,
    compileTemplate: true,
    resetAsyncDataToUndefined: true,
    templateUtils: true,
    relativeWatchPaths: true,
    normalizeComponentNames: false,
    spaLoadingTemplateLocation: 'within',
    parseErrorData: false,
    pendingWhenIdle: true,
    alwaysRunFetchOnKeyChange: true,
    defaults: {
      useAsyncData: {
        deep: true
      }
    }
  },
  features: {
    inlineStyles: true
  },
  unhead: {
    renderSSRHeadOptions: {
      omitLineBreaks: false
    }
  },
  devtools: { enabled: true },
  modules: [
    '@nuxt/ui',
    '@nuxtjs/google-fonts',
    '@nuxt/icon',
    '@nuxt/image'
  ],

  googleFonts: {
    families: {
      Montserrat: true,
    }
  },

  image: {
    domains: ['https://vghtpyughervgulwbkud.supabase.co'],
    ipx: {}
  },

  // Add runtime config for Supabase
  runtimeConfig: {
    public: {
      supabaseUrl: process.env.SUPABASE_URL,
      supabaseKey: process.env.SUPABASE_ANON_KEY,
    }
  },

  ui: {
    global: true
  },
  colorMode: {
    preference: 'light',
    fallback: 'light',
    classSuffix: ''
  }
})