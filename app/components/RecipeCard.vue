<script setup lang="ts">
import { type Recipe } from '~~/types/types';

defineProps<{
    recipe: Recipe;
}>();

const totalTime = (recipe: Recipe) => {
  return ((+recipe.cooking_time_minutes || 0) + (+recipe.preparation_time_minutes || 0)) || 'N/A';
};
</script>

<template>
  <UCard class="hover:scale-[1.02] transition-transform duration-300 flex flex-col h-full bg-white border border-primary-green/20">
    <template #header>
      <div class="relative overflow-hidden rounded-lg h-64">
        <NuxtImg 
          :src="recipe.image_url" 
          sizes="xs:100vw sm:50vw lg:400px" 
          format="jpg" 
          densities="x1" 
          :alt="recipe.name || 'Recipe Image'" 
          class="w-full h-full object-cover" 
        />
        <UBadge
          v-if="recipe.difficulty"
          :color="recipe.difficulty === 'Easy' ? 'green' : recipe.difficulty === 'Medium' ? 'yellow' : 'red'"
          class="absolute top-3 right-3"
          size="lg"
        >
          {{ recipe.difficulty }}
        </UBadge>
      </div>
    </template>

    <div class="space-y-4 flex-grow">
      <h3 class="text-xl lg:text-2xl font-semibold text-primary-dark line-clamp-2">
        {{ recipe.name || 'No Name' }}
      </h3>
      
      <div class="flex flex-wrap gap-4 text-sm text-gray-700">
        <div class="flex items-center gap-1.5">
          <UIcon name="i-heroicons-clock" class="text-primary-green" />
          <span>{{ totalTime(recipe) }} minit</span>
        </div>
        <div class="flex items-center gap-1.5">
          <UIcon name="i-heroicons-fire" class="text-accent-cream" />
          <span>{{ recipe.calories_per_serving ?? 'N/A' }} kalori</span>
        </div>
      </div>

      <div v-if="recipe.tags && recipe.tags.length > 0" class="flex flex-wrap gap-2">
        <UBadge
          v-for="(tag, index) in recipe.tags.slice(0, 3)"
          :key="index"
          color="green"
          variant="soft"
          size="sm"
        >
          {{ tag }}
        </UBadge>
      </div>
    </div>

    <template #footer>
      <UButton
        :to="`/recipes/${recipe.id}`"
        color="green"
        size="lg"
        block
        trailing-icon="i-heroicons-arrow-right"
        class="bg-primary-green hover:bg-primary-green/90 text-white"
      >
        Lihat Resipi
      </UButton>
    </template>
  </UCard>
</template>