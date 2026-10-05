CREATE TABLE `recipe_translations` (
	`id` integer PRIMARY KEY NOT NULL,
	`recipe_id` integer NOT NULL,
	`locale` text NOT NULL,
	`name` text,
	`description` text,
	`history` text,
	`ingredients` text,
	`steps` text,
	FOREIGN KEY (`recipe_id`) REFERENCES `recipes`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `recipe_translations_recipe_id_locale_unique` ON `recipe_translations` (`recipe_id`,`locale`);--> statement-breakpoint
CREATE INDEX `idx_recipe_translations_recipe_id` ON `recipe_translations` (`recipe_id`);--> statement-breakpoint
CREATE TABLE `recipes` (
	`id` integer PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`origin` text,
	`description` text,
	`ingredients` text DEFAULT '[]' NOT NULL,
	`steps` text DEFAULT '[]' NOT NULL,
	`preparation_time_minutes` integer,
	`cooking_time_minutes` integer,
	`servings` integer,
	`difficulty` text,
	`cuisine` text,
	`calories_per_serving` integer,
	`tags` text DEFAULT '[]' NOT NULL,
	`user_id` integer,
	`image_url` text,
	`rating` real,
	`review_count` integer,
	`meal_type` text DEFAULT '[]' NOT NULL,
	`history` text,
	`created_at` text,
	`updated_at` text
);
