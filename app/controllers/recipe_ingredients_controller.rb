class RecipeIngredientsController < ApplicationController
	before_action :find_recipe_ingredient, only: [:edit, :update, :destroy]

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
			flash[:message] = "Sucessfully added ingredient. Add more or GO BACK!"
			redirect_to new_recipe_recipe_ingredient_path(@recipe_ingredient.recipe)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @recipe_ingredient.update(recipe_ingredient_params)
			flash[:message] = "Successfully updated Recipe"
			redirect_to recipe_path(@recipe_ingredient.recipe)
		else
			render :edit
		end
	end

	def destroy		
		@recipe_ingredient.delete

		redirect_to recipe_path(@recipe_ingredient.recipe)
	end

	private

	def recipe_ingredient_params
		params.require(:recipe_ingredient).permit(:quantity, :recipe_id, :ingredient_id, ingredient_attributes: [:name])
	end

	def find_recipe_ingredient
		@recipe_ingredient = RecipeIngredient.find_by(id: params[:id])
	end
	
end
