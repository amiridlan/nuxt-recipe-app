import { sqliteTable, integer, text, real, uniqueIndex, index } from 'drizzle-orm/sqlite-core';

export const recipes = sqliteTable('recipes', {
  id: integer('id').primaryKey(),
  name: text('name').notNull(),
  origin: text('origin'),
  description: text('description'),
  ingredients: text('ingredients', { mode: 'json' }).$type<string[]>().notNull().default([]),
  steps: text('steps', { mode: 'json' }).$type<string[]>().notNull().default([]),
  preparationTimeMinutes: integer('preparation_time_minutes'),
  cookingTimeMinutes: integer('cooking_time_minutes'),
  servings: integer('servings'),
  difficulty: text('difficulty'),
  cuisine: text('cuisine'),
  caloriesPerServing: integer('calories_per_serving'),
  tags: text('tags', { mode: 'json' }).$type<string[]>().notNull().default([]),
  userId: integer('user_id'),
  imageUrl: text('image_url'),
  rating: real('rating'),
  reviewCount: integer('review_count'),
  mealType: text('meal_type', { mode: 'json' }).$type<string[]>().notNull().default([]),
  history: text('history'),
  createdAt: text('created_at'),
  updatedAt: text('updated_at')
});

export const recipeTranslations = sqliteTable('recipe_translations', {
  id: integer('id').primaryKey(),
  recipeId: integer('recipe_id').notNull().references(() => recipes.id, { onDelete: 'cascade' }),
  locale: text('locale').notNull(),
  name: text('name'),
  description: text('description'),
  history: text('history'),
  ingredients: text('ingredients', { mode: 'json' }).$type<string[]>(),
  steps: text('steps', { mode: 'json' }).$type<string[]>()
}, (table) => ({
  recipeLocaleUnique: uniqueIndex('recipe_translations_recipe_id_locale_unique').on(table.recipeId, table.locale),
  recipeIdIdx: index('idx_recipe_translations_recipe_id').on(table.recipeId)
}));
