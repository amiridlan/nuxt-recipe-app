import { asc, eq } from 'drizzle-orm';

export default eventHandler(async (event) => {
  const { origin } = getQuery(event);

  const rows = await db
    .select()
    .from(schema.recipes)
    .where(eq(schema.recipes.origin, String(origin ?? '')))
    .orderBy(asc(schema.recipes.id));

  return rows.map(mapRecipeRow);
});
