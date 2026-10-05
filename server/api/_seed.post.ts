import { basename } from 'node:path';
import recipesSeed from '../db/seed-data/recipes.json';
import translationsSeed from '../db/seed-data/recipe_translations.json';

export default eventHandler(async (event) => {
  const config = useRuntimeConfig(event);
  const providedSecret = getHeader(event, 'x-seed-secret');

  if (!config.seedSecret || providedSecret !== config.seedSecret) {
    throw createError({ statusCode: 401, statusMessage: 'Unauthorized' });
  }

  const existing = await db.select().from(schema.recipes).limit(1);
  if (existing.length > 0) {
    throw createError({ statusCode: 409, statusMessage: 'Recipes table already has data — refusing to double-seed' });
  }

  const storage = useStorage('assets:seedImages');

  for (const recipe of recipesSeed as any[]) {
    let imageUrl: string | null = null;

    if (recipe.image_url) {
      const filename = basename(recipe.image_url);
      const fileBuffer = await storage.getItemRaw(filename);
      if (fileBuffer) {
        await blob.put(filename, fileBuffer, { addRandomSuffix: false });
        imageUrl = `/images/${filename}`;
      }
    }

    await db.insert(schema.recipes).values({
      id: recipe.id,
      name: recipe.name,
      origin: recipe.origin,
      description: recipe.description,
      ingredients: recipe.ingredients ?? [],
      steps: recipe.steps ?? [],
      preparationTimeMinutes: recipe.preparation_time_minutes,
      cookingTimeMinutes: recipe.cooking_time_minutes,
      servings: recipe.servings,
      difficulty: recipe.difficulty,
      cuisine: recipe.cuisine,
      caloriesPerServing: recipe.calories_per_serving,
      tags: recipe.tags ?? [],
      userId: recipe.user_id,
      imageUrl,
      rating: recipe.rating,
      reviewCount: recipe.review_count,
      mealType: recipe.meal_type ?? [],
      history: recipe.history,
      createdAt: recipe.created_at,
      updatedAt: recipe.updated_at
    });
  }

  for (const translation of translationsSeed as any[]) {
    await db.insert(schema.recipeTranslations).values({
      id: translation.id,
      recipeId: translation.recipe_id,
      locale: translation.locale,
      name: translation.name,
      description: translation.description,
      history: translation.history,
      ingredients: translation.ingredients,
      steps: translation.steps
    });
  }

  return {
    recipes: recipesSeed.length,
    translations: translationsSeed.length
  };
});
