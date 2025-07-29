<script setup lang="ts">
import { type Recipe } from '~~/types/types';

defineProps<{
    recipe: Recipe;
}>();
</script>

<template>
    <div class="flex flex-col shadow rounded-md">
            <NuxtImg :src="`https://v2-makanan-api.netlify.app/recipes/${recipe.id}/image`" sizes="xs:100vw sm:50vw lg:400px" format="jpg" densities="x1" alt="" class="rounded-t-md" />
            <div class="flex flex-col py-6 px-4 flex-1">
                <p class="text-xl lg:text-2xl font-semibold mb-2">{{ recipe.name || 'No Name' }}</p>
                <div class="font-normal w-full bg-white/80 flex gap-8 text-lg lg:text-xl mb-4 mt-auto">
                <div class="flex items-center gap-1">
                    <Icon name="mdi:clock-time-eight-outline" style="color: #f79f1a" />
                    <span>{{ recipe.cookingTime ?? 'N/A' }} minutes</span>
                </div>
                <div class="flex items-center gap-1">
                    <Icon name="mdi:fire" style="color: #f79f1a" />
                    <span>{{ recipe.caloriesPerServing ?? 'N/A' }} calories per serving</span>
                </div>
                </div>
                <NuxtLink
                :to="`/recipes/${recipe.id}`"
                class="px-4 py-2 text-white self-start bg-dodgeroll-gold-500 rounded-md text-base lg:text-lg cursor-pointer"
                >
                View
                </NuxtLink>
            </div>
            </div>
</template>
