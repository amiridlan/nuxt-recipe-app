<script setup lang="ts">
const { t, locale, setLocale } = useI18n();

const links = computed(() => [
  { label: t('nav.home'), to: '/', icon: 'i-heroicons-home' },
  { label: t('nav.about'), to: '/about', icon: 'i-heroicons-information-circle' }
]);

const languages = [
  { code: 'en', label: 'English', flag: '🇬🇧' },
  { code: 'ms', label: 'Bahasa Melayu', flag: '🇲🇾' },
  { code: 'ja', label: '日本語', flag: '🇯🇵' }
];

const currentLanguage = computed(
  () => languages.find(l => l.code === locale.value) ?? languages[0]
);

const langMenuOpen = ref(false);

const onLocaleChange = (code: string) => {
  setLocale(code as 'en' | 'ms' | 'ja');
  langMenuOpen.value = false;
};
</script>

<template>
  <header class="border-b border-primary-green/30 bg-primary-dark">
    <UContainer>
      <nav class="flex items-center justify-between py-4 w-full">
        <!-- Logo on the left -->
        <NuxtLink to="/" class="flex gap-2 items-center hover:opacity-80 transition-opacity flex-shrink-0">
          <NuxtImg width="56px" src="/icon-green.png" format="webp" alt="SajianMalaya Logo" />
          <span class="text-2xl md:text-3xl font-bold text-accent-cream">SajianMalaya</span>
        </NuxtLink>

        <!-- Desktop Navigation on the right -->
        <div class="hidden md:flex gap-4 items-center ml-auto">
          <UButton
            v-for="link in links"
            :key="link.to"
            :to="link.to"
            :icon="link.icon"
            color="primary"
            variant="ghost"
            size="lg"
            class="text-white hover:text-accent-cream hover:bg-primary-green/20"
          >
            {{ link.label }}
          </UButton>

          <!-- Language Switcher -->
          <div class="relative">
            <UButton
              color="primary"
              variant="ghost"
              size="lg"
              trailing-icon="i-heroicons-chevron-down"
              class="text-white hover:text-accent-cream hover:bg-primary-green/20"
              @click="langMenuOpen = !langMenuOpen"
            >
              {{ currentLanguage.flag }} {{ currentLanguage.code.toUpperCase() }}
            </UButton>
            <div
              v-if="langMenuOpen"
              class="absolute right-0 top-full mt-1 z-50 bg-white rounded-lg shadow-lg border border-gray-200 min-w-[160px] py-1"
            >
              <button
                v-for="lang in languages"
                :key="lang.code"
                class="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 flex items-center gap-2"
                :class="{ 'font-semibold bg-gray-50': lang.code === locale }"
                @click="onLocaleChange(lang.code)"
              >
                {{ lang.flag }} {{ lang.label }}
              </button>
            </div>
          </div>
        </div>

        <!-- Mobile Navigation on the right -->
        <div class="md:hidden ml-auto flex items-center gap-2">
          <!-- Mobile Language Switcher -->
          <div class="relative">
            <UButton
              color="primary"
              variant="ghost"
              size="lg"
              class="text-white hover:text-accent-cream"
              @click="langMenuOpen = !langMenuOpen"
            >
              {{ currentLanguage.flag }}
            </UButton>
            <div
              v-if="langMenuOpen"
              class="absolute right-0 top-full mt-1 z-50 bg-white rounded-lg shadow-lg border border-gray-200 min-w-[160px] py-1"
            >
              <button
                v-for="lang in languages"
                :key="lang.code"
                class="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 flex items-center gap-2"
                :class="{ 'font-semibold bg-gray-50': lang.code === locale }"
                @click="onLocaleChange(lang.code)"
              >
                {{ lang.flag }} {{ lang.label }}
              </button>
            </div>
          </div>

          <!-- Mobile Menu -->
          <UDropdown :items="[links]" :popper="{ placement: 'bottom-end' }">
            <UButton
              icon="i-heroicons-bars-3"
              color="primary"
              variant="ghost"
              size="lg"
              class="text-white hover:text-accent-cream"
            />
          </UDropdown>
        </div>
      </nav>
    </UContainer>
  </header>
</template>