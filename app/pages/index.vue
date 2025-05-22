<script setup lang="ts">
import { type Recipe } from '~~/types/types';
import RecipeCard from '~/components/RecipeCard.vue';

const {data, error} = await useFetch<Recipe[]>('https://myfood-api-production.up.railway.app/api/recipes');

useSeoMeta({
  title: "SajianMalaya",
  description: "Recipes for you to cook!",
  ogTitle: "SajianMalaya",
  ogDescription: "Recipes for you to cook!",
  ogImage: "/nuxt-course-hero.png",
  ogUrl: `https://nuxtrecipes.netlify.app/`,
  twitterTitle: "SajianMalaya",
  twitterDescription: "Recipes for you to cook!",
  twitterImage: "/nuxt-course-hero.png",
  twitterCard: "summary",
});
</script>

<template>
    <main>
        <section class="bg-[#f1f1f1]">
            <div class="container flex flex-col lg:flex-row items-center py-20 gap-10">
                <div class="flex-1 order-2 lg:order-1 text-center lg:text-left">
                <h1 class="text-4xl lg:text-6xl font-extrabold mb-6 text-balance">
                    Cari Resipi dengan Mudah!
                </h1>
                <p class="text-xl lg:text-2xl mb-8 text-balance">
                    Anda boleh buat carian dengan nama sajian, bahan yang diperlukan dan juga masa memasak.
                </p>
                <button
                    class="px-4 py-2 text-white self-start bg-dodgeroll-gold-500 rounded-md text-lg cursor-pointer"
                >
                    Cari Resipi
                </button>
                </div>
                <div class="flex-1 order-1 lg:order-2">
                    <NuxtImg sizes="xs:100vw sm:667px" src="/nuxt-course-hero.png" format="avif" alt="" />
                </div>
            </div>
        </section>

        <section class="py-20 container">
        <h2 class="text-3xl lg:text-5xl mb-2">Resipi Terbaru</h2>
        <p class="text-lg lg:text-xl mb-8">Check out our most popular recipes!</p>
        <div v-if="!error && data?.length" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-x-4 gap-y-8">
            <RecipeCard v-for="recipe in data" :key="recipe.id" :recipe="recipe" />
        </div>
        <p v-else class="text-xl">Please try again later.</p>
        </section>
    </main>
</template>
