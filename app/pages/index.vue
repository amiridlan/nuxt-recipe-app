<script setup lang="ts">
import { ref, computed, watch } from 'vue';
import { type Recipe } from '~~/types/types';

const { fetchRecipes } = useRecipes();

// Fetch recipes from Supabase
const { data, error, pending } = await useAsyncData<Recipe[]>('recipes', () => fetchRecipes());

const searchQuery = ref('');
const selectedOrigin = ref('');
const selectedIngredients = ref<string[]>([]);
const allRecipes = ref<Recipe[]>(data.value || []);

watch(data, (newData) => {
  allRecipes.value = newData || [];
});

const recipes = computed(() => {
  let filtered = allRecipes.value;
  
  // Filter by name
  if (searchQuery.value) {
    filtered = filtered.filter(r => r.name.toLowerCase().includes(searchQuery.value.toLowerCase()));
  }
  
  // Filter by origin
  if (selectedOrigin.value) {
    filtered = filtered.filter(r => r.origin === selectedOrigin.value);
  }
  
  // Filter by ingredients (at least one ingredient must match)
  if (selectedIngredients.value.length > 0) {
    filtered = filtered.filter(recipe => {
      if (!recipe.ingredients || recipe.ingredients.length === 0) return false;
      
      return selectedIngredients.value.some(selectedIngredient => 
        recipe.ingredients.some(recipeIngredient => 
          recipeIngredient.toLowerCase().includes(selectedIngredient.toLowerCase())
        )
      );
    });
  }
  
  return filtered;
});

const handleSearch = (query: string) => {
  searchQuery.value = query;
};

const handleFilter = (origin: string) => {
  selectedOrigin.value = origin;
};

const handleFilterIngredients = (ingredients: string[]) => {
  selectedIngredients.value = ingredients;
};

const scrollToRecipes = () => {
  const recipesSection = document.getElementById('recipes-section');
  recipesSection?.scrollIntoView({ behavior: 'smooth' });
};

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
    <!-- Hero Section -->
    <section class="bg-gradient-to-br from-primary-dark to-primary-dark/90">
      <UContainer>
        <div class="flex flex-col lg:flex-row items-center py-20 gap-10">
          <div class="flex-1 order-2 lg:order-1 text-center lg:text-left space-y-6">
            
            <h1 class="text-4xl lg:text-6xl font-extrabold text-balance text-accent-cream">
              Cari Resipi dengan Mudah!
            </h1>
            
            <p class="text-xl lg:text-2xl text-balance text-white/90">
              Anda boleh buat carian dengan nama sajian, bahan yang diperlukan dan juga masa memasak.
            </p>
            
            <div class="flex flex-wrap gap-4 justify-center lg:justify-start">
              <UButton
                size="xl"
                icon="i-heroicons-magnifying-glass"
                @click="scrollToRecipes"
                class="bg-primary-green hover:bg-primary-green/90 text-white"
              >
                Cari Resipi
              </UButton>
              
            </div>

          </div>
          
          <div class="flex-1 order-1 lg:order-2">
            <NuxtImg 
              sizes="xs:100vw sm:667px" 
              src="/img-hero.png" 
              format="avif" 
              alt="Hero Image" 
            />
          </div>
        </div>
      </UContainer>
    </section>

    <!-- Recipes Section -->
    <section id="recipes-section" class="py-20 bg-primary-dark">
      <UContainer>
        <div class="space-y-8">
          <!-- Section Header -->
          <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
            <div>
              <h2 class="text-3xl lg:text-5xl font-bold text-accent-cream mb-2">
                Resipi Terbaru
              </h2>
              <p class="text-lg text-white/80">
                Terokai koleksi resipi terbaik kami
              </p>
            </div>
            
            <UBadge 
              v-if="!pending && recipes.length > 0" 
              color="green" 
              variant="subtle" 
              size="lg"
              class="bg-primary-green/20 text-accent-cream"
            >
              {{ recipes.length }} resipi ditemui
            </UBadge>
          </div>

          <!-- Search and Filter -->
          <RecipeSearchFilter 
            @search="handleSearch" 
            @filter="handleFilter"
            @filter-ingredients="handleFilterIngredients"
          />

          <!-- Loading State -->
          <div v-if="pending" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <USkeleton v-for="i in 6" :key="i" class="h-96" />
          </div>

          <!-- Error State -->
          <UAlert
            v-else-if="error"
            icon="i-heroicons-exclamation-triangle"
            color="red"
            variant="soft"
            title="Ralat memuat data"
            description="Data tidak dapat dipaparkan. Sila cuba lagi kemudian."
          />

          <!-- No Results -->
          <UCard v-else-if="recipes.length === 0" class="bg-white">
            <div class="text-center py-12">
              <UIcon name="i-heroicons-magnifying-glass" class="text-6xl text-primary-green/50 mb-4" />
              <h3 class="text-xl font-semibold text-primary-dark mb-2">
                Tiada resipi ditemui
              </h3>
              <p class="text-gray-600">
                Cuba cari dengan kata kunci yang berbeza
              </p>
            </div>
          </UCard>

          <!-- Recipe Grid -->
          <div v-else class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <RecipeCard 
              v-for="recipe in recipes" 
              :key="recipe.id" 
              :recipe="recipe" 
            />
          </div>
        </div>
      </UContainer>
    </section>
  </main>
</template>