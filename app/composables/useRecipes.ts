import type { Recipe } from '~~/types/types';

export const useRecipes = () => {
  // Fetch all recipes (list view — always returns original Malay data)
  const fetchRecipes = async () => {
    return $fetch<Recipe[]>('/api/recipes');
  };

  // Fetch single recipe by ID, merged with translation if locale is not 'ms'
  const fetchRecipeById = async (id: string | number, locale: string = 'ms') => {
    return $fetch<Recipe>(`/api/recipes/${id}`, { query: { locale } });
  };

  // Search recipes by name
  const searchRecipes = async (query: string) => {
    return $fetch<Recipe[]>('/api/recipes/search', { query: { q: query } });
  };

  // Filter recipes by origin
  const filterByOrigin = async (origin: string) => {
    return $fetch<Recipe[]>('/api/recipes/filter', { query: { origin } });
  };

  return {
    fetchRecipes,
    fetchRecipeById,
    searchRecipes,
    filterByOrigin
  };
};
