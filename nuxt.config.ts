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

  nitro: {
    preset: 'cloudflare_pages',
    serverAssets: [
      { baseName: 'seedImages', dir: './assets/seed-images' }
    ]
  },

  modules: [
    '@nuxt/ui',
    '@nuxt/image',
    '@nuxtjs/google-fonts',
    '@nuxtjs/i18n',
    '@nuxthub/core'
  ],

  hub: {
    db: 'sqlite',
    // Cloudflare R2 has no local emulation under `nuxt dev`, so fall back to a
    // filesystem-backed blob store in dev and only use R2 once actually deployed.
    blob: process.env.NODE_ENV === 'development' ? { driver: 'fs', dir: '.data/blob' } : true
  },

  runtimeConfig: {
    seedSecret: process.env.SEED_SECRET || ''
  },

  i18n: {
    defaultLocale: 'en',
    strategy: 'no_prefix',
    lazy: true,
    langDir: 'locales',
    locales: [
      { code: 'en', name: 'English', file: 'en.json' },
      { code: 'ms', name: 'Bahasa Melayu', file: 'ms.json' },
      { code: 'ja', name: '日本語', file: 'ja.json' }
    ],
    detectBrowserLanguage: {
      useCookie: true,
      cookieKey: 'sajian_locale',
      redirectOn: 'root'
    }
  },

  // Ensure components are auto-imported
  components: true,

  googleFonts: {
    families: {
      Montserrat: true,
    }
  },

  image: {
    ipx: {}
  }
})