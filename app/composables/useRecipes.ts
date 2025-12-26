import type { Recipe } from '~~/types/types';

export const useRecipes = () => {
  const { $supabase } = useNuxtApp();

  // Fetch all recipes
  const fetchRecipes = async () => {
    const { data, error } = await $supabase
      .from('recipes')
      .select('*')
      .order('id', { ascending: true });

    if (error) {
      console.error('Error fetching recipes:', error);
      throw error;
    }

    return data as Recipe[];
  };

  // Fetch single recipe by ID
  const fetchRecipeById = async (id: string | number) => {
    const { data, error } = await $supabase
      .from('recipes')
      .select('*')
      .eq('id', id)
      .single();

    if (error) {
      console.error('Error fetching recipe:', error);
      throw error;
    }

    return data as Recipe;
  };

  // Search recipes by name
  const searchRecipes = async (query: string) => {
    const { data, error } = await $supabase
      .from('recipes')
      .select('*')
      .ilike('name', `%${query}%`)
      .order('id', { ascending: true });

    if (error) {
      console.error('Error searching recipes:', error);
      throw error;
    }

    return data as Recipe[];
  };

  // Filter recipes by origin
  const filterByOrigin = async (origin: string) => {
    const { data, error } = await $supabase
      .from('recipes')
      .select('*')
      .eq('origin', origin)
      .order('id', { ascending: true });

    if (error) {
      console.error('Error filtering recipes:', error);
      throw error;
    }

    return data as Recipe[];
  };

  return {
    fetchRecipes,
    fetchRecipeById,
    searchRecipes,
    filterByOrigin
  };
};