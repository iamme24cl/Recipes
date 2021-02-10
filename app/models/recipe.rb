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
	validate :is_title_case
	before_validation :make_title_case

	scope :top_rated, -> {left_joins(:reviews).group(:id).order('avg(stars) desc').limit(8)}

	def self.by_user(user_id)
    where(user: user_id)
  end

	def self.by_ingredient(ingredient)
		ingredient = Ingredient.find_by(ingredient)
		ingredient.recipes
	end

	def avg_rating
		stars = []
		self.reviews.each do |review|
			stars << review.stars
		end
		avg_stars = stars.sum(0.0) / stars.size
	end

	private

	def is_title_case
		if title.split.any?{|w|w[0].upcase != w[0]}
			errors.add(:title, "Title must be in title case")
		end
	end

	def make_title_case
		self.title = self.title.titlecase
	end
end
  
