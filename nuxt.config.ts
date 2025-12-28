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
    '@nuxt/image',
    '@nuxtjs/google-fonts'
  ],

  components: true,

  googleFonts: {
    families: {
      Montserrat: true,
    }
  },

  image: {
    domains: ['https://vghtpyughervgulwbkud.supabase.co'],
    ipx: {}
  },

  runtimeConfig: {
    public: {
      supabaseUrl: process.env.SUPABASE_URL,
      supabaseKey: process.env.SUPABASE_ANON_KEY,
    }
  }
})