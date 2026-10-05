import { and, eq } from 'drizzle-orm';

export default eventHandler(async (event) => {
  const id = Number(getRouterParam(event, 'id'));
  if (!Number.isFinite(id)) {
    throw createError({ statusCode: 400, statusMessage: 'Invalid recipe id' });
  }

  const query = getQuery(event);
  const locale = typeof query.locale === 'string' ? query.locale : 'ms';

  const [base] = await db.select().from(schema.recipes).where(eq(schema.recipes.id, id)).limit(1);
  if (!base) {
    throw createError({ statusCode: 404, statusMessage: 'Recipe not found' });
  }

  const recipe = mapRecipeRow(base);

  if (locale === 'ms') {
    return recipe;
  }

  const [translation] = await db
    .select()
    .from(schema.recipeTranslations)
    .where(and(eq(schema.recipeTranslations.recipeId, id), eq(schema.recipeTranslations.locale, locale)))
    .limit(1);

  if (!translation) {
    return recipe;
  }

  return {
    ...recipe,
    ...(translation.name && { name: translation.name }),
    ...(translation.description && { description: translation.description }),
    ...(translation.history && { history: translation.history }),
    ...(translation.ingredients?.length && { ingredients: translation.ingredients }),
    ...(translation.steps?.length && { steps: translation.steps })
  };
});
