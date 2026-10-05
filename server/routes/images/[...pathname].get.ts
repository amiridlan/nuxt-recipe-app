import { blob } from '#imports';

export default eventHandler(async (event) => {
  const pathname = getRouterParam(event, 'pathname');
  if (!pathname) {
    throw createError({ statusCode: 404, statusMessage: 'Not Found' });
  }
  return blob.serve(event, pathname);
});
