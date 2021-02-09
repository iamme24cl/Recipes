class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipes = Recipe.all
		render layout: 'recipes_index'
	end

	def top_trending
		@recipes = Recipe.top_trending
		render :index 
	end

	def show
	end

	def new
		@recipe = Recipe.new			
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			# @recipe.image.purge
			# @recipe.image.attach(params[:ice_cream][:image])
			flash[:message] = "Successfully created Recipe"
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			flash[:message] = "Successfully updated Recipe"
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
		
	end

	def destroy
		@recipe.destroy

		redirect_to recipes_path
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :cook_time, :instructions, :image)			
	end

	def find_recipe
		@recipe = Recipe.find_by(id: params[:id])
	end

end
