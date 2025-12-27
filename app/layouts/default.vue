<script setup lang="ts">
const currentYear = new Date().getFullYear();

const socialLinks = [
  {
    icon: 'i-heroicons-globe-alt',
    to: 'https://amiridlan.my/',
    label: 'Twitter'
  },
  {
    icon: 'i-simple-icons-github',
    to: 'https://github.com/amiridlan',
    label: 'Facebook'
  },
  {
    icon: 'i-simple-icons-instagram',
    to: 'https://www.instagram.com/_amirmir6/',
    label: 'Instagram'
  }
];
</script>

<template>
  <div class="flex flex-col min-h-screen">
    <BaseNavigation />
    
    <div class="flex-grow">
      <slot />
    </div>

    <!-- Footer -->
    <footer class="bg-primary-dark border-t border-primary-green/30 mt-auto">
      <UContainer>
        <div class="py-12">
          <div class="flex flex-col md:flex-row justify-between items-center gap-8">
            <!-- Brand Section -->
            <div class="space-y-4 text-center md:text-left">
              <div class="flex items-center gap-2 justify-center md:justify-start">
                <NuxtImg width="48px" src="/icon-green.png" format="webp" alt="SajianMalaya Logo" />
                <span class="text-2xl font-bold text-accent-cream">SajianMalaya</span>
              </div>
              <p class="text-white/80">
                Platform resipi digital untuk Malaysia dan rantau Asia Tenggara.
              </p>
            </div>

            <!-- Social Links -->
            <div class="space-y-4 text-center md:text-right">
              <h3 class="text-lg font-semibold text-accent-cream text-center">Pautan</h3>
              <div class="flex gap-3 justify-center md:justify-end">
                <UButton
                  v-for="social in socialLinks"
                  :key="social.label"
                  :icon="social.icon"
                  :to="social.to"
                  target="_blank"
                  color="green"
                  variant="soft"
                  size="lg"
                  square
                  class="bg-primary-green/20 hover:bg-primary-green/30 text-accent-cream"
                />
              </div>
            </div>
          </div>

          <UDivider class="my-8 border-primary-green/30" />

          <!-- Copyright -->
          <div class="text-center text-sm text-white/70">
            <p>© {{ currentYear }} Amir Idlan</p>
          </div>
        </div>
      </UContainer>
    </footer>
  </div>
</template>