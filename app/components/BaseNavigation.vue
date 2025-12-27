<script setup lang="ts">
const links = [
  {
    label: 'Utama',
    to: '/',
    icon: 'i-heroicons-home'
  },
  {
    label: 'Tentang Kami',
    to: '/about',
    icon: 'i-heroicons-information-circle'
  }
];
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
        </div>

        <!-- Mobile Navigation on the right -->
        <div class="md:hidden ml-auto">
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