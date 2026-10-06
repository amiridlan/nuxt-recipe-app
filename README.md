# SajianMalaya - Recipe Discovery Platform

A modern recipe discovery web application built with Nuxt 3, deployed entirely on Cloudflare. Browse, search, and filter through a collection of recipes with an intuitive interface.

## Features

- **Recipe Browsing**: View a comprehensive collection of recipes with detailed information
- **Advanced Search**: Search recipes by name, origin, or ingredients
- **Smart Filtering**: Filter recipes by multiple criteria simultaneously
- **Responsive Design**: Fully responsive layout that works on all devices
- **Cloudflare-native data**: Recipes live in Cloudflare D1, images in Cloudflare R2 — no free-tier pausing
- **SEO Optimized**: Meta tags and SEO-friendly structure
- **Loading States**: Skeleton loaders for better user experience

## Tech Stack

- **Framework**: [Nuxt 3](https://nuxt.com/) - Vue.js framework with SSR capabilities
- **UI Library**: [Nuxt UI](https://ui.nuxt.com/) - Beautiful UI components
- **Database**: [Cloudflare D1](https://developers.cloudflare.com/d1/) via [NuxtHub](https://hub.nuxt.com/) + [Drizzle ORM](https://orm.drizzle.team/)
- **Image storage**: [Cloudflare R2](https://developers.cloudflare.com/r2/) via NuxtHub Blob, served through `/images/*`
- **Hosting**: [Cloudflare Workers](https://workers.cloudflare.com/) (static assets + SSR worker), deployed via Git integration
- **Image Optimization**: Nuxt Image with format conversion (AVIF)
- **Styling**: Tailwind CSS (via Nuxt UI)
- **Icons**: Nuxt Icon with Heroicons
- **Fonts**: Google Fonts (Montserrat)

## Prerequisites

- Node.js (v18 or higher)
- npm
- A [Cloudflare](https://dash.cloudflare.com/) account (free tier)

## Setup

Install dependencies:

```bash
npm install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
npm run dev
```

In development, the database runs as a local SQLite file (`.data/db/sqlite.db`) and blob storage as local files (`.data/blob/`) — no Cloudflare account needed for local work. These are automatically swapped for real Cloudflare D1 and R2 once deployed.

## Database schema & migrations

The schema lives in `server/db/schema.ts` (Drizzle ORM). After changing it, regenerate migrations:

```bash
npx nuxt-db generate
```

Migrations are applied automatically on `npm run dev` and `npm run build` (against the local dev database). **Cloudflare D1 cannot apply migrations during a CI build** — after the first deploy (and after any future schema change), apply them directly against the production database with:

```bash
npx wrangler d1 migrations apply sajianmalaya --remote
```

This reads `migrations_dir` from `wrangler.jsonc` at the repo root, so no extra flags are needed.

## Seeding data

A one-time, secret-gated seed endpoint imports the original recipe dataset (`server/db/seed-data/`) and uploads the bundled images (`server/assets/seed-images/`) into blob storage:

```bash
curl -X POST -H "x-seed-secret: <SEED_SECRET>" https://<your-deployment>/api/_seed
```

It refuses to run if the `recipes` table already has data, so it's safe to leave deployed. `SEED_SECRET` is set as a variable/secret on the Worker (Cloudflare dashboard → your Worker → Settings → Variables and Secrets) — it is deliberately **not** stored in `wrangler.jsonc` since that file is committed to the repo.

## Production

Build the application for production:

```bash
npm run build
```

Locally preview production build:

```bash
npm run preview
```

## Deploying to Cloudflare

This project deploys as a **Cloudflare Worker** (static assets + SSR, not classic Pages) via Git integration — push to `main` and Cloudflare's Workers Builds CI runs `npm run build` then `wrangler deploy` automatically, using the root-level `wrangler.jsonc`.

`wrangler.jsonc` already declares:
- the D1 binding (`DB` → database `sajianmalaya`)
- the R2 binding (`BLOB` → bucket `sajianmalaya`)
- the build output (`main`, `assets`)

The only things configured outside this file, directly in the Cloudflare dashboard:
- the `SEED_SECRET` variable/secret (see "Seeding data" above)
- the Git integration itself (which repo/branch to build from)

One-time setup for a fresh clone of this repo deploying to a *different* Cloudflare account: create a D1 database and R2 bucket, swap their name/ID into `wrangler.jsonc`, connect the repo in Workers & Pages → Create → Workers → Connect to Git, then run the migration command above against the new database before the first seed.

## Project Structure

```
wrangler.jsonc          # Worker build output + D1/R2 binding config (committed, no secrets)
app/
├── components/          # Reusable Vue components
│   ├── BaseNavigation.vue
│   ├── RecipeCard.vue
│   ├── RecipeSearchFilter.vue
│   └── LoadingSpinner.vue
├── composables/
│   └── useRecipes.ts   # Calls the /api/recipes endpoints
├── pages/              # Route pages
│   ├── index.vue       # Home page with recipe listing
│   ├── about.vue       # About page
│   └── recipes/
│       └── [id].vue    # Dynamic recipe detail page
├── layouts/            # Layout components
│   ├── default.vue     # Default layout
│   └── login.vue       # Login layout
└── app.vue             # Root component
server/
├── api/recipes/        # Recipe list/detail/search/filter endpoints (Drizzle + D1)
├── api/_seed.post.ts   # One-time data/image import (see above)
├── routes/images/      # Serves R2-backed blobs at /images/*
├── db/schema.ts         # Drizzle schema (recipes, recipe_translations)
├── db/migrations/       # Generated SQL migrations
└── assets/seed-images/ # Source images used by the seed endpoint
```
