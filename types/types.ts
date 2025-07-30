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
    preparationTimeMinutes:    number;
    cookingTimeMinutes:        number;
    servings:           number;
    difficulty:         string;
    cuisine:            string;
    caloriesPerServing: number;
    tags:               string[];
    userId:             number;
    image:              string;
    rating:             number;
    reviewCount:        number;
    mealType:           string[];
}