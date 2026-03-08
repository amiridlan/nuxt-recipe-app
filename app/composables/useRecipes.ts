import type { Recipe } from '~~/types/types';

export const useRecipes = () => {
  const { $supabase } = useNuxtApp();

  // Fetch all recipes (list view — always returns original Malay data)
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

  // Fetch single recipe by ID, merged with translation if locale is not 'ms'
  const fetchRecipeById = async (id: string | number, locale: string = 'ms') => {
    const { data: base, error } = await $supabase
      .from('recipes')
      .select('*')
      .eq('id', id)
      .single();

    if (error) {
      console.error('Error fetching recipe:', error);
      throw error;
    }

    // Malay is the source language — return base data directly
    if (locale === 'ms') return base as Recipe;

    // Fetch translation row for the requested locale
    const { data: trans } = await $supabase
      .from('recipe_translations')
      .select('name, description, history, ingredients, steps')
      .eq('recipe_id', id)
      .eq('locale', locale)
      .maybeSingle();

    if (!trans) return base as Recipe;

    // Merge: translation fields override base only when present
    return {
      ...base,
      ...(trans.name        && { name: trans.name }),
      ...(trans.description && { description: trans.description }),
      ...(trans.history     && { history: trans.history }),
      ...(trans.ingredients?.length && { ingredients: trans.ingredients }),
      ...(trans.steps?.length       && { steps: trans.steps }),
    } as Recipe;
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