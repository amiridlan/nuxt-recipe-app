# SajianMalaya - Recipe Discovery Platform

A modern recipe discovery web application built with Nuxt 3 and powered by Supabase. Browse, search, and filter through a collection of recipes with an intuitive interface.

## Features

- **Recipe Browsing**: View a comprehensive collection of recipes with detailed information
- **Advanced Search**: Search recipes by name, origin, or ingredients
- **Smart Filtering**: Filter recipes by multiple criteria simultaneously
- **Responsive Design**: Fully responsive layout that works on all devices
- **Supabase Integration**: Real-time data fetching from Supabase database
- **SEO Optimized**: Meta tags and SEO-friendly structure
- **Loading States**: Skeleton loaders for better user experience

## Tech Stack

- **Framework**: [Nuxt 3](https://nuxt.com/) - Vue.js framework with SSR capabilities
- **UI Library**: [Nuxt UI](https://ui.nuxt.com/) - Beautiful UI components
- **Database**: [Supabase](https://supabase.com/) - Backend-as-a-Service with PostgreSQL
- **Image Optimization**: Nuxt Image with format conversion (AVIF)
- **Styling**: Tailwind CSS (via Nuxt UI)
- **Icons**: Nuxt Icon with Heroicons
- **Fonts**: Google Fonts (Montserrat)

## Prerequisites

- Node.js (v18 or higher)
- npm or yarn
- Supabase account and project

## Environment Variables

Create a `.env` file in the root directory with the following variables:

```env
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

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

## Production

Build the application for production:

```bash
npm run build
```

Locally preview production build:

```bash
npm run preview
```

## GitHub Actions - Supabase Keep-Alive

This project includes a GitHub Actions workflow that automatically pings the Supabase database every 4 days to prevent the free-tier project from being paused due to inactivity.

### Setup GitHub Secrets

To enable the keep-alive workflow, add these secrets to your GitHub repository:

1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add the following repository secrets:
   - `SUPABASE_URL`: Your Supabase project URL
   - `SUPABASE_ANON_KEY`: Your Supabase publishable/anon key

The workflow runs automatically on a schedule and can also be triggered manually from the Actions tab.

## Project Structure

```
app/
├── components/          # Reusable Vue components
│   ├── BaseNavigation.vue
│   ├── RecipeCard.vue
│   ├── RecipeSearchFilter.vue
│   └── LoadingSpinner.vue
├── pages/              # Route pages
│   ├── index.vue       # Home page with recipe listing
│   ├── about.vue       # About page
│   └── recipes/
│       └── [id].vue    # Dynamic recipe detail page
├── plugins/            # Nuxt plugins
│   └── supabase.ts     # Supabase client configuration
├── layouts/            # Layout components
│   ├── default.vue     # Default layout
│   └── login.vue       # Login layout
└── app.vue             # Root component
```
