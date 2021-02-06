class RecipeIngredientsController < ApplicationController

	def new
		if @recipe = Recipe.find_by(id: params[:beer_id])
			@recipe_ingredient = @recipe.recipe_ingredients.build
		else
			@recipe_ingredient = RecipeIngredient.new
		end
	end

	def create
	end

	def edit
	end

	def update
	end

	private

	def recipe_ingredient_params
		params.require(:recipe_ingredient).permit(:quantity)
	end
end
