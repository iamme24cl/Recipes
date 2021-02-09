## Recipe Manager

# User
	name
	email
	password_digest
	has many recipes
	has_many reviews
	has_many reviewed_recipes through reviews

# Recipes
	title
	cooktime
	instructions
	user_id / belongs_to user
	has_many reviews
	has_many users through reviews
	has_many recipe_ingredients
	has_many ingredients through recipe ingredients


# Recipe_Ingredients
	quantity
	recipe_id / belongs_to recipe
	ingredient_id / belongs_to ingredient	


# Ingredients
	name
	has_many recipe_ingredients
	has_many recipes through recipe_ingredients

# Reviews
	recipe_id / belongs to recipe
	user_id / belongs to user
	stars
	title
	content

TODO - 

Sprint 1 - Database, Models and Resources
	Create and run migrations
	Define necessary routes
	Generate models
		- define associations
		- define validations
	Generate Controllers and views as you go 
## Done...

Sprint 2 - User
	Sign up User
		- validations and has_secure_password
	Display User profile
	Log in and Log out User
		- use helper methods in ApplicationController
### Done...

Sprint 3 - Recipes & Ingredients
	Create/Edit Recipe
		- Create/edit ingredient with nested form within a recipe
	Display Recipes within diffrent scopes using class level scope method
	Use a class level URL method - 'recipes/top_rated' may be???

Sprint 4 - Reviews
### Done

Sprint 5 - Omniauth Authentication
	Implement authentication using Google, Facebook and Github
Sprint 6 - Layout Adjustments
	Use Active Storage for images
### Done

Sprint 7 - Refactor Code


### Next Steps -
define a top_rated method for recipes




