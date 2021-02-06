class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])
	end

	def new
		@recipe = Recipe.new			
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			flash[:message] = "Successfully created Recipe"
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :cook_time, :instructions)			
	end

end
