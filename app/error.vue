<script setup lang="ts">
import type { NuxtError } from '#app';

defineProps({
    error: Object as () => NuxtError,
});

const getErrorIcon = (statusCode?: number) => {
  if (statusCode === 404) return 'i-heroicons-magnifying-glass';
  if (statusCode === 500) return 'i-heroicons-exclamation-triangle';
  return 'i-heroicons-x-circle';
};

const getErrorColor = (statusCode?: number) => {
  if (statusCode === 404) return 'primary';
  if (statusCode === 500) return 'red';
  return 'orange';
};

const getErrorTitle = (statusCode?: number) => {
  if (statusCode === 404) return 'Halaman Tidak Dijumpai';
  if (statusCode === 500) return 'Ralat Pelayan';
  return 'Ralat Berlaku';
};

const getErrorDescription = (statusCode?: number, message?: string) => {
  if (message) return message;
  if (statusCode === 404) return 'Halaman yang anda cari tidak wujud atau telah dipindahkan.';
  if (statusCode === 500) return 'Terdapat masalah pada pelayan. Sila cuba lagi kemudian.';
  return 'Sesuatu yang tidak dijangka telah berlaku. Sila cuba lagi.';
};
</script>

<template>
  <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-primary-dark to-primary-dark/90 px-4">
    <UContainer>
      <div class="max-w-2xl mx-auto">
        <UCard class="bg-white border border-primary-green/20">
          <div class="text-center space-y-6 py-12">
            <!-- Error Icon -->
            <div class="flex justify-center">
              <div 
                class="p-6 rounded-full"
                :class="`bg-${getErrorColor(error?.statusCode)}-100`"
              >
                <UIcon 
                  :name="getErrorIcon(error?.statusCode)" 
                  class="text-7xl"
                  :class="`text-${getErrorColor(error?.statusCode)}-500`"
                />
              </div>
            </div>

            <!-- Error Code -->
            <div>
              <h1 class="text-8xl lg:text-9xl font-bold text-primary-dark mb-2">
                {{ error?.statusCode || '500' }}
              </h1>
              <UBadge 
                :color="getErrorColor(error?.statusCode)" 
                variant="soft" 
                size="lg"
              >
                {{ getErrorTitle(error?.statusCode) }}
              </UBadge>
            </div>

            <!-- Error Message -->
            <p class="text-xl text-gray-600 max-w-md mx-auto">
              {{ getErrorDescription(error?.statusCode, error?.statusMessage) }}
            </p>

            <!-- Actions -->
            <div class="flex flex-col sm:flex-row gap-4 justify-center pt-6">
              <UButton
                to="/"
                size="xl"
                icon="i-heroicons-home"
                class="bg-primary-green hover:bg-primary-green/90 text-white"
              >
                Kembali ke Laman Utama
              </UButton>
              
              <UButton
                color="gray"
                variant="soft"
                size="xl"
                icon="i-heroicons-arrow-path"
                @click="$router.go(-1)"
              >
                Halaman Sebelumnya
              </UButton>
            </div>

            <!-- Help Text -->
            <div class="pt-8 border-t border-gray-200">
              <p class="text-sm text-gray-500">
                Jika masalah berterusan, sila hubungi sokongan kami.
              </p>
            </div>
          </div>
        </UCard>
      </div>
    </UContainer>
  </div>
</template>