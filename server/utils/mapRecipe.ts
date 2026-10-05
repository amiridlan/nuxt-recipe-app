import type { recipes } from '../db/schema';

type RecipeRow = typeof recipes.$inferSelect;

export function mapRecipeRow(row: RecipeRow) {
  return {
    id: row.id,
    name: row.name,
    origin: row.origin,
    description: row.description,
    ingredients: row.ingredients,
    steps: row.steps,
    preparation_time_minutes: row.preparationTimeMinutes,
    cooking_time_minutes: row.cookingTimeMinutes,
    servings: row.servings,
    difficulty: row.difficulty,
    cuisine: row.cuisine,
    calories_per_serving: row.caloriesPerServing,
    tags: row.tags,
    user_id: row.userId,
    image_url: row.imageUrl,
    rating: row.rating,
    review_count: row.reviewCount,
    meal_type: row.mealType,
    history: row.history,
    created_at: row.createdAt,
    updated_at: row.updatedAt
  };
}
