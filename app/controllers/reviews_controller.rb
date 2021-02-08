class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]
	before_action :find_recipe, only: [:index, :new]

	def index
		if @recipe 
			@reviews = @recipe.reviews
		else
			@reviews = Review.all
		end
	end

	def show		
	end

	def new
		if @recipe
			@review = @recipe.reviews.build
		else
			@review = Review.new
		end
	end

	def create
		@review = current_user.reviews.build(review_params)
		if @review.save
			redirect_to recipe_path(@review.recipe)
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @review.update(review_params)
			redirect_to recipe_path(@review.recipe)
		else
			render :edit
		end
	end	

	private

	def review_params
		params.require(:review).permit(:stars, :title, :content, :user_id, :recipe_id)		
	end

	def find_review
		@review = Review.find_by(id: params[:id])
	end

	def find_recipe
		@recipe = Recipe.find_by(id: params[:recipe_id])
	end

end
