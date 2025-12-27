<script setup lang="ts">
const features = [
  {
    icon: 'i-heroicons-magnifying-glass',
    title: 'Carian Mudah',
    description: 'Cari resipi mengikut nama, bahan, atau masa memasak dengan mudah dan pantas.'
  },
  {
    icon: 'i-heroicons-funnel',
    title: 'Penapis Canggih',
    description: 'Tapis resipi mengikut asal negara, kesukaran, dan kategori masakan.'
  },
  {
    icon: 'i-heroicons-clock',
    title: 'Maklumat Lengkap',
    description: 'Setiap resipi dilengkapi dengan masa persediaan, kalori, dan langkah terperinci.'
  },
  {
    icon: 'i-heroicons-photo',
    title: 'Imej Berkualiti',
    description: 'Gambar resipi yang jelas dan menarik untuk membantu anda memasak.'
  }
];

const stats = [
  { label: 'Resipi', value: '100+', icon: 'i-heroicons-book-open' },
  { label: 'Negara', value: '10+', icon: 'i-heroicons-globe-alt' },
  { label: 'Kategori', value: '20+', icon: 'i-heroicons-squares-2x2' },
  { label: 'Pengguna Gembira', value: '1000+', icon: 'i-heroicons-users' }
];
</script>

<template>
  <main>
    <!-- Hero Section -->
    <section class="bg-gradient-to-br from-primary-dark to-primary-dark/90">
      <UContainer>
        <div class="py-20 text-center space-y-6">
          <UBadge color="green" variant="subtle" size="lg" class="bg-primary-green/20 text-accent-cream border-primary-green/30">
            <UIcon name="i-heroicons-information-circle" class="mr-1" />
            Tentang Kami
          </UBadge>
          
          <h1 class="text-4xl lg:text-6xl font-extrabold text-accent-cream">
            Tentang SajianMalaya
          </h1>
          
          <p class="text-xl lg:text-2xl text-white/90 max-w-3xl mx-auto">
            Platform resipi digital yang menyenaraikan pelbagai resipi masakan dari Malaysia dan rantau Asia Tenggara.
          </p>
        </div>
      </UContainer>
    </section>

    <!-- Mission Section -->
    <section class="py-20 bg-primary-dark">
      <UContainer>
        <UCard class="bg-white border border-primary-green/20">
          <div class="space-y-6">
            <div class="flex items-center gap-3">
              <UIcon name="i-heroicons-heart" class="text-4xl text-primary-green" />
              <h2 class="text-3xl lg:text-4xl font-bold text-primary-dark">
                Misi Kami
              </h2>
            </div>
            
            <p class="text-xl text-gray-700 leading-relaxed">
              SajianMalaya ialah suatu aplikasi yang menyenaraikan resipi-resipi yang terdapat di Malaysia dan sekitarnya. 
              Kami komited untuk memudahkan akses kepada resipi tradisional dan moden, membantu anda memasak dengan yakin.
            </p>
            
            <UDivider />
            
            <div class="space-y-4">
              <h3 class="text-2xl font-bold text-primary-dark">Teknologi</h3>
              <div class="flex flex-wrap gap-3">
                <UBadge color="green" variant="soft" size="lg">Nuxt 3</UBadge>
                <UBadge color="green" variant="soft" size="lg">Vue 3</UBadge>
                <UBadge color="green" variant="soft" size="lg">TypeScript</UBadge>
                <UBadge color="green" variant="soft" size="lg">Supabase</UBadge>
                <UBadge color="green" variant="soft" size="lg">NuxtUI</UBadge>
                <UBadge color="green" variant="soft" size="lg">TailwindCSS</UBadge>
              </div>
            </div>
          </div>
        </UCard>
      </UContainer>
    </section>

    <!-- Features Section -->
    <section class="py-20 bg-primary-dark/50">
      <UContainer>
        <div class="text-center mb-12 space-y-4">
          <h2 class="text-3xl lg:text-5xl font-bold text-accent-cream">
            Ciri-ciri Utama
          </h2>
          <p class="text-xl text-white/80">
            Alat yang anda perlukan untuk mencari dan memasak resipi kegemaran anda
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <UCard v-for="(feature, index) in features" :key="index" class="bg-white border border-primary-green/20">
            <div class="text-center space-y-4">
              <div class="flex justify-center">
                <div class="bg-primary-green/10 p-4 rounded-full">
                  <UIcon :name="feature.icon" class="text-4xl text-primary-green" />
                </div>
              </div>
              <h3 class="text-xl font-bold text-primary-dark">
                {{ feature.title }}
              </h3>
              <p class="text-gray-600">
                {{ feature.description }}
              </p>
            </div>
          </UCard>
        </div>
      </UContainer>
    </section>

    <!-- Stats Section -->
    <section class="py-20 bg-primary-dark">
      <UContainer>
        <UCard class="bg-white border border-primary-green/20">
          <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div v-for="(stat, index) in stats" :key="index" class="text-center space-y-3">
              <UIcon :name="stat.icon" class="text-5xl text-primary-green mx-auto" />
              <div class="text-4xl font-bold text-primary-dark">
                {{ stat.value }}
              </div>
              <div class="text-lg text-gray-600">
                {{ stat.label }}
              </div>
            </div>
          </div>
        </UCard>
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