## Recipe Manager

# User
	username
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

	





