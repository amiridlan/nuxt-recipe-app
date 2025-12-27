<script setup lang="ts">
import { useRoute } from 'vue-router';
import { type Recipe } from '~~/types/types';

const route = useRoute();
const id = route.params.id as string;

const { fetchRecipeById } = useRecipes();

// Fetch recipe from Supabase
const { data: recipe, error, pending } = await useAsyncData<Recipe>(
  `recipe-${id}`,
  () => fetchRecipeById(id)
);

const activeTab = ref(0);

useSeoMeta({
  title: recipe?.value?.name || 'Recipe Details',
  description: recipe?.value?.description || '',
  ogTitle: recipe?.value?.name || 'Recipe Details',
  ogDescription: recipe?.value?.description || '',
  ogImage: recipe?.value?.image_url || '/nuxt-course-hero.png',
  ogUrl: `https://nuxtrecipes.netlify.app/recipes/${id}`,
  twitterTitle: recipe?.value?.name || 'Recipe Details',
  twitterDescription: recipe?.value?.description || '',
  twitterImage: recipe?.value?.image_url || '/nuxt-course-hero.png',
  twitterCard: "summary",
});
</script>

<template>
  <main class="py-10 bg-primary-dark min-h-screen">
    <UContainer>
      <!-- Loading State -->
      <div v-if="pending" class="space-y-6">
        <USkeleton class="h-12 w-2/3" />
        <USkeleton class="h-96 w-full" />
        <USkeleton class="h-64 w-full" />
      </div>

      <!-- Error State -->
      <UAlert
        v-else-if="error"
        icon="i-heroicons-exclamation-triangle"
        color="red"
        variant="soft"
        title="Ralat memuat resipi"
        description="Gagal memuat resipi. Sila cuba lagi kemudian."
        class="mb-6"
      />

      <!-- Recipe Content -->
      <div v-else-if="recipe" class="space-y-8">
        <!-- Back Button -->
        <UButton
          to="/"
          color="green"
          variant="ghost"
          icon="i-heroicons-arrow-left"
          size="lg"
          class="text-white hover:text-accent-cream hover:bg-primary-green/20"
        >
          Kembali ke Senarai
        </UButton>

        <!-- Recipe Header -->
        <div class="space-y-4">
          <div class="flex flex-wrap gap-3">
            <UBadge
              v-if="recipe.difficulty"
              :color="recipe.difficulty === 'Easy' ? 'green' : recipe.difficulty === 'Medium' ? 'yellow' : 'red'"
              size="lg"
            >
              {{ recipe.difficulty }}
            </UBadge>
            <UBadge
              v-if="recipe.cuisine"
              color="green"
              variant="soft"
              size="lg"
              class="bg-primary-green/20 text-accent-cream"
            >
              {{ recipe.cuisine }}
            </UBadge>
            <UBadge
              v-if="recipe.origin"
              color="gray"
              variant="soft"
              size="lg"
              class="bg-accent-cream/20 text-accent-cream"
            >
              <UIcon name="i-heroicons-map-pin" class="mr-1" />
              {{ recipe.origin }}
            </UBadge>
          </div>

          <h1 class="text-4xl lg:text-6xl font-bold text-accent-cream">
            {{ recipe.name || 'No Name' }}
          </h1>

          <p v-if="recipe.description" class="text-xl text-white/80">
            {{ recipe.description }}
          </p>
        </div>

        <!-- Recipe Image -->
        <UCard class="bg-white border border-primary-green/20">
          <NuxtImg 
            :src="recipe.image_url" 
            :alt="recipe.name" 
            class="rounded-lg w-full h-auto max-h-[600px] object-cover" 
          />
        </UCard>

        <!-- Recipe Info Grid -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
          <UCard class="bg-white border border-primary-green/20">
            <div class="text-center space-y-2">
              <UIcon name="i-heroicons-clock" class="text-3xl text-primary-green mx-auto" />
              <div class="text-2xl font-bold text-primary-dark">
                {{ recipe.preparation_time_minutes ?? 'N/A' }}
              </div>
              <div class="text-sm text-gray-600">Minit Persediaan</div>
            </div>
          </UCard>

          <UCard class="bg-white border border-primary-green/20">
            <div class="text-center space-y-2">
              <UIcon name="i-heroicons-fire" class="text-3xl text-accent-cream mx-auto" />
              <div class="text-2xl font-bold text-primary-dark">
                {{ recipe.cooking_time_minutes ?? 'N/A' }}
              </div>
              <div class="text-sm text-gray-600">Minit Memasak</div>
            </div>
          </UCard>

          <UCard class="bg-white border border-primary-green/20">
            <div class="text-center space-y-2">
              <UIcon name="i-heroicons-users" class="text-3xl text-primary-green mx-auto" />
              <div class="text-2xl font-bold text-primary-dark">
                {{ recipe.servings ?? 'N/A' }}
              </div>
              <div class="text-sm text-gray-600">Hidangan</div>
            </div>
          </UCard>

          <UCard class="bg-white border border-primary-green/20">
            <div class="text-center space-y-2">
              <UIcon name="i-heroicons-bolt" class="text-3xl text-accent-cream mx-auto" />
              <div class="text-2xl font-bold text-primary-dark">
                {{ recipe.calories_per_serving ?? 'N/A' }}
              </div>
              <div class="text-sm text-gray-600">Kalori</div>
            </div>
          </UCard>
        </div>

        <!-- Tabs for Ingredients and Instructions -->
        <UTabs 
          v-model="activeTab" 
          :items="[
            { label: 'Bahan-bahan', icon: 'i-heroicons-shopping-bag' },
            { label: 'Langkah-langkah', icon: 'i-heroicons-list-bullet' }
          ]"
        >
          <template #item="{ item }">
            <UCard v-if="item.label === 'Bahan-bahan'" class="bg-white border border-primary-green/20">
              <template #header>
                <h3 class="text-2xl font-bold text-primary-dark">Bahan-bahan</h3>
              </template>
              
              <ul class="space-y-3">
                <li 
                  v-for="(ingredient, index) in recipe.ingredients || []" 
                  :key="index"
                  class="flex items-start gap-3"
                >
                  <UIcon name="i-heroicons-check-circle" class="text-primary-green mt-1 flex-shrink-0" />
                  <span class="text-lg text-gray-700">{{ ingredient }}</span>
                </li>
              </ul>
              
              <div v-if="!recipe.ingredients || recipe.ingredients.length === 0" class="text-center py-8 text-gray-500">
                Tiada maklumat bahan
              </div>
            </UCard>

            <UCard v-else class="bg-white border border-primary-green/20">
              <template #header>
                <h3 class="text-2xl font-bold text-primary-dark">Langkah-langkah</h3>
              </template>
              
              <ol class="space-y-6">
                <li 
                  v-for="(step, index) in recipe.steps || []" 
                  :key="index"
                  class="flex gap-4"
                >
                  <UBadge color="green" size="lg" class="flex-shrink-0 bg-primary-green text-white">
                    {{ index + 1 }}
                  </UBadge>
                  <p class="text-lg text-gray-700 pt-1">{{ step }}</p>
                </li>
              </ol>
              
              <div v-if="!recipe.steps || recipe.steps.length === 0" class="text-center py-8 text-gray-500">
                Tiada maklumat langkah memasak
              </div>
            </UCard>
          </template>
        </UTabs>

        <!-- Tags -->
        <UCard v-if="recipe.tags && recipe.tags.length > 0" class="bg-white border border-primary-green/20">
          <template #header>
            <h3 class="text-xl font-bold text-primary-dark">Tags</h3>
          </template>
          
          <div class="flex flex-wrap gap-2">
            <UBadge
              v-for="(tag, index) in recipe.tags"
              :key="index"
              color="green"
              variant="soft"
              size="md"
            >
              {{ tag }}
            </UBadge>
          </div>
        </UCard>
      </div>
    </UContainer>
  </main>
</template>