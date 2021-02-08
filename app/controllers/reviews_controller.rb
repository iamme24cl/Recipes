class ReviewsController < ApplicationController
	before_action :find_review, only: [:show, :edit, :update, :destroy]

	def index
		
	end

	def show
		
	end

	def new
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end	

	private

	def review_params
		params.require(:review).permit(:stars, :title, :content, :user_id, :recipe_id)		
	end

end
