class RecipeIngredientsController < ApplicationController

	def new
		if @recipe = Recipe.find_by(id: params[:recipe_id])
			@recipe_ingredient = @recipe.recipe_ingredients.build
			@recipe_ingredient.build_ingredient
		end
	end
		

	def create
		# raise params.inspect
		@recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
		if @recipe_ingredient.save
			redirect_to recipe_path(@recipe_ingredient.recipe)
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	private

	def recipe_ingredient_params
		params.require(:recipe_ingredient).permit(:quantity, :recipe_id, :ingredient_id, ingredient_attributes: [:name])
	end
end
