class Recipe < ApplicationRecord
	has_many :reviews, dependent: :destroy
	has_many :users, through: :reviews
	belongs_to :user
	has_many :recipe_ingredients, dependent: :destroy
	has_many :ingredients, through: :recipe_ingredients
	has_one_attached :image

	validates :title, presence: true
	validates :cook_time, presence: true
	validates :instructions, presence: true



	def self.top_trending
		
	end

	def avg_rating
		stars = []
		self.reviews.each do |review|
			stars << review.stars
		end
		avg_stars = stars.sum(0.0) / stars.size
	end
end
  
