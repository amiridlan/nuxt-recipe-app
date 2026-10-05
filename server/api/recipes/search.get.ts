import { asc, sql } from 'drizzle-orm';

export default eventHandler(async (event) => {
  const { q } = getQuery(event);
  const query = String(q ?? '').toLowerCase();

  const rows = await db
    .select()
    .from(schema.recipes)
    .where(sql`lower(${schema.recipes.name}) like ${'%' + query + '%'}`)
    .orderBy(asc(schema.recipes.id));

  return rows.map(mapRecipeRow);
});
