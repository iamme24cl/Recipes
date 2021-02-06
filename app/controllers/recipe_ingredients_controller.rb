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
		# binding.pry
		if @recipe_ingredient.save
			redirect_to recipe_path(@recipe_ingredient.recipe)
		else
			render :new
		end
	end

	def edit
		@recipe_ingredient = RecipeIngredient.find_by(id: params[:id])
	end

	def update
		@recipe_ingredient = RecipeIngredient.find_by(id: params[:id])
		if @recipe_ingredient.update(recipe_ingredient_params)
			flash[:message] = "Successfully updated Recipe"
			redirect_to recipe_path(@recipe_ingredient.recipe)
		else
			render :edit
		end
	end

	def destroy
		@recipe_ingredient = RecipeIngredient.find_by(id: params[:id])
		@recipe_ingredient.delete

		redirect_to recipe_path(@recipe_ingredient.recipe)
	end

	private

	def recipe_ingredient_params
		params.require(:recipe_ingredient).permit(:quantity, :recipe_id, :ingredient_id, ingredient_attributes: [:name])
	end

	# def ingredient_params
	# 	params.require(:ingredient).permit(:name)
	# end
end
