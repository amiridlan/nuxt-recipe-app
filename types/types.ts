export interface RecipeResponse {
    recipes: Recipe[];
    total:   number;
    skip:    number;
    limit:   number;
}

export interface Recipe {
    id:                 number;
    name:               string;
    origin:             string;
    description:        string;
    ingredients:        string[];
    instructions:       string[];
    steps:              string[];
    preparation_time_minutes:    number;  // Updated from camelCase
    cooking_time_minutes:        number;  // Updated from camelCase
    servings:           number;
    difficulty:         string;
    cuisine:            string;
    calories_per_serving: number;  // Updated from camelCase
    tags:               string[];
    user_id:            number;  // Updated from camelCase
    image_url:          string;  // Updated: now comes from Supabase
    rating:             number;
    review_count:       number;  // Updated from camelCase
    meal_type:          string[];  // Updated from camelCase
    created_at?:        string;
    updated_at?:        string;
}