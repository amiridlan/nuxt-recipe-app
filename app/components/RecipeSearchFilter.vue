<script setup lang="ts">
import { ref } from 'vue';

const searchQuery = ref('');
const selectedOrigin = ref('');
const selectedIngredients = ref<string[]>([]);
const ingredientInput = ref('');

const origins = [
  { label: 'Semua Asal', value: '' },
  { label: 'Malaysia', value: 'Malaysia' },
  { label: 'Indonesia', value: 'Indonesia' },
  { label: 'Singapore', value: 'Singapore' },
  { label: 'Thailand', value: 'Thailand' },
  { label: 'Vietnam', value: 'Vietnam' }
];

const emit = defineEmits<{
  search: [query: string];
  filter: [origin: string];
  filterIngredients: [ingredients: string[]];
}>();

const handleSearch = () => {
  emit('search', searchQuery.value);
};

const handleFilter = () => {
  emit('filter', selectedOrigin.value);
};

const addIngredient = () => {
  const ingredient = ingredientInput.value.trim();
  if (ingredient && !selectedIngredients.value.includes(ingredient)) {
    selectedIngredients.value.push(ingredient);
    ingredientInput.value = '';
    emit('filterIngredients', selectedIngredients.value);
  }
};

const removeIngredient = (ingredient: string) => {
  selectedIngredients.value = selectedIngredients.value.filter(i => i !== ingredient);
  emit('filterIngredients', selectedIngredients.value);
};

const clearFilters = () => {
  searchQuery.value = '';
  selectedOrigin.value = '';
  selectedIngredients.value = [];
  ingredientInput.value = '';
  emit('search', '');
  emit('filter', '');
  emit('filterIngredients', []);
};
</script>

<template>
  <UCard class="mb-8 bg-white border border-primary-green/20">
    <div class="flex flex-col gap-4">
      <div class="flex flex-col md:flex-row gap-4">
        <!-- Search Input -->
        <div class="flex-1">
          <UInput
            v-model="searchQuery"
            icon="i-heroicons-magnifying-glass"
            size="lg"
            placeholder="Cari nama resipi..."
            @input="handleSearch"
            class="[&>input]:text-primary-dark"
          >
            <template #trailing>
              <UButton
                v-show="searchQuery"
                color="gray"
                variant="link"
                icon="i-heroicons-x-mark"
                :padded="false"
                @click="searchQuery = ''; handleSearch()"
              />
            </template>
          </UInput>
        </div>

        <!-- Origin Filter -->
        <USelectMenu
          v-model="selectedOrigin"
          :options="origins"
          placeholder="Pilih Asal"
          size="lg"
          class="md:w-64"
          @change="handleFilter"
        >
          <template #leading>
            <UIcon name="i-heroicons-map-pin" class="text-primary-green" />
          </template>
        </USelectMenu>

        <!-- Clear Filters Button -->
        <UButton
          v-if="searchQuery || selectedOrigin || selectedIngredients.length > 0"
          color="gray"
          variant="soft"
          size="lg"
          icon="i-heroicons-x-circle"
          @click="clearFilters"
        >
          Reset
        </UButton>
      </div>

      <!-- Ingredient Filter -->
      <div class="flex gap-2">
        <div class="flex-1">
          <UInput
            v-model="ingredientInput"
            icon="i-heroicons-beaker"
            size="lg"
            placeholder="Tambah bahan (contoh: ayam, bawang, cili)..."
            @keyup.enter="addIngredient"
            class="[&>input]:text-primary-dark"
          />
        </div>
        <UButton
          size="lg"
          icon="i-heroicons-plus"
          @click="addIngredient"
          :disabled="!ingredientInput.trim()"
          class="bg-primary-green hover:bg-primary-green/90 text-white disabled:bg-primary-green disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Tambah
        </UButton>
      </div>

      <!-- Selected Ingredients -->
      <div v-if="selectedIngredients.length > 0" class="space-y-2">
        <p class="text-sm text-gray-600 font-medium">Bahan yang dipilih:</p>
        <div class="flex flex-wrap gap-2">
          <UBadge
            v-for="ingredient in selectedIngredients"
            :key="ingredient"
            color="green"
            variant="soft"
            size="md"
            class="flex items-center gap-1"
          >
            <UIcon name="i-heroicons-beaker" class="text-xs" />
            {{ ingredient }}
            <UButton
              color="primary"
              variant="link"
              icon="i-heroicons-x-mark"
              size="2xs"
              :padded="false"
              @click="removeIngredient(ingredient)"
            />
          </UBadge>
        </div>
      </div>

      <!-- Active Filters Display -->
      <div v-if="searchQuery || selectedOrigin" class="flex flex-wrap gap-2">
        <UBadge
          v-if="searchQuery"
          color="green"
          variant="soft"
          size="md"
        >
          Carian: {{ searchQuery }}
          <UButton
            color="primary"
            variant="link"
            icon="i-heroicons-x-mark"
            size="2xs"
            :padded="false"
            @click="searchQuery = ''; handleSearch()"
          />
        </UBadge>
        <UBadge
          v-if="selectedOrigin"
          color="green"
          variant="soft"
          size="md"
        >
          Asal: {{ selectedOrigin }}
          <UButton
            color="primary"
            variant="link"
            icon="i-heroicons-x-mark"
            size="2xs"
            :padded="false"
            @click="selectedOrigin = ''; handleFilter()"
          />
        </UBadge>
      </div>
    </div>
  </UCard>
</template>