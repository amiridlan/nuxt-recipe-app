import { asc } from 'drizzle-orm';

export default eventHandler(async () => {
  const rows = await db.select().from(schema.recipes).orderBy(asc(schema.recipes.id));
  return rows.map(mapRecipeRow);
});
