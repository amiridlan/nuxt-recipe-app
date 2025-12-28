<script setup lang="ts">
const technologies = [
  { name: 'Nuxt 3', icon: 'i-simple-icons-nuxtdotjs' },
  { name: 'Vue 3', icon: 'i-simple-icons-vuedotjs' },
  { name: 'TypeScript', icon: 'i-simple-icons-typescript' },
  { name: 'Supabase', icon: 'i-simple-icons-supabase' },
  { name: 'NuxtUI', icon: 'i-simple-icons-nuxtdotjs' },
  { name: 'TailwindCSS', icon: 'i-simple-icons-tailwindcss' }
];
</script>

<template>
  <main>
    <!-- Hero and Mission Section -->
    <section class="bg-gradient-to-br from-primary-dark to-primary-dark/90 py-20">
      <UContainer>
        <div class="space-y-12">
          <!-- Title -->
          <h1 class="text-center text-4xl lg:text-6xl font-extrabold text-accent-cream">
            Tentang SajianMalaya
          </h1>

          <!-- Mission Card -->
          <UCard class="bg-white border border-primary-green/20">
            <div class="space-y-6">
              
              <p class="text-center text-xl text-gray-700 leading-relaxed">
                SajianMalaya ialah platform resipi digital yang menyenaraikan pelbagai resipi masakan dari Malaysia.
              </p>
              
              <UDivider />
              
              <div class="space-y-4">
                <div class="flex items-center gap-3">
                  <UIcon name="i-heroicons-code-bracket" class="text-3xl text-primary-green" />
                  <h3 class="text-2xl font-bold text-primary-dark">Teknologi</h3>
                </div>
                <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                  <div 
                    v-for="tech in technologies" 
                    :key="tech.name"
                    class="flex items-center gap-3 p-3 rounded-lg bg-primary-green/5 hover:bg-primary-green/10 transition-colors"
                  >
                    <UIcon :name="tech.icon" class="text-2xl text-primary-green flex-shrink-0" />
                    <span class="text-lg font-medium text-gray-700">{{ tech.name }}</span>
                  </div>
                </div>
              </div>
            </div>
          </UCard>
        </div>
      </UContainer>
    </section>

    <!-- CTA Section -->
    <section class="py-20 bg-gradient-to-br from-primary-green/20 to-primary-green/10">
      <UContainer>
        <div class="text-center space-y-6">
          <h2 class="text-3xl lg:text-5xl font-bold text-accent-cream">
            Mulakan Pencarian Resipi Anda
          </h2>
          <p class="text-xl text-white/90 max-w-2xl mx-auto">
            Terokai koleksi resipi kami dan mulakan perjalanan masakan anda hari ini!
          </p>
          <UButton
            to="/"
            size="xl"
            icon="i-heroicons-arrow-right"
            trailing
            class="bg-primary-green hover:bg-primary-green/90 text-white"
          >
            Lihat Semua Resipi
          </UButton>
        </div>
      </UContainer>
    </section>
  </main>
</template>