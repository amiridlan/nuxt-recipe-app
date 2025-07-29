<script setup lang="ts">
import { useRoute } from 'vue-router';
import { type Recipe } from '~~/types/types';

const route = useRoute();
const id = route.params.id as string;

const { data: recipe, error } = await useFetch<Recipe>(`https://v2-makanan-api.netlify.app/recipes/${id}`);

useSeoMeta({
  title: recipe?.value?.name || 'Recipe Details',
  description: '',
  ogTitle: recipe?.value?.name || 'Recipe Details',
  ogDescription: '',
  ogImage: recipe?.value?.image ? `https://v2-makanan-api.netlify.app${recipe.value.image}` : '/nuxt-course-hero.png',
  ogUrl: `https://nuxtrecipes.netlify.app/recipes/${id}`,
  twitterTitle: recipe?.value?.name || 'Recipe Details',
  twitterDescription: '',
  twitterImage: recipe?.value?.image ? `https://v2-makanan-api.netlify.app${recipe.value.image}` : '/nuxt-course-hero.png',
  twitterCard: "summary",
});
</script>

<template>
  <main class="container py-10">
    <div v-if="error" class="text-red-500 text-center">Failed to load recipe. Please try again later.</div>
    <div v-else-if="!recipe" class="text-center">Loading...</div>
    <div v-else class="max-w-4xl mx-auto">
      <h1 class="text-4xl font-bold mb-4">{{ recipe.name || 'No Name' }}</h1>
      <NuxtImg :src="`https://v2-makanan-api.netlify.app${recipe.image}`" alt="food image" class="rounded-lg mb-6" />
      <div class="mb-4">
        <strong>Preparation Time:</strong> {{ recipe.preparationTime ?? 'N/A' }} minutes
      </div>
      <div class="mb-4">
        <strong>Cook Time:</strong> {{ recipe.cookingTime ?? 'N/A' }} minutes
      </div>
      <div class="mb-4">
        <strong>Calories per Serving:</strong> {{ recipe.caloriesPerServing ?? 'N/A' }}
      </div>
      <div class="mb-4">
        <strong>Ingredients:</strong>
        <ul class="list-disc list-inside">
          <li v-for="(ingredient, index) in recipe.ingredients || []" :key="index">{{ ingredient }}</li>
        </ul>
      </div>
      <div class="mb-4">
        <strong>Instructions:</strong>
        <ol class="list-decimal list-inside">
          <li v-for="(step, index) in recipe.steps || []" :key="index">{{ step }}</li>
        </ol>
      </div>
    </div>
  </main>
</template>
