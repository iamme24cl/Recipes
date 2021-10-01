class Recipe < ApplicationRecord
	has_many :reviews, dependent: :destroy
	has_many :users, through: :reviews
	belongs_to :user
	has_many :recipe_ingredients, dependent: :destroy
	has_many :ingredients, through: :recipe_ingredients
	has_one_attached :image

	validates :title, presence: true, length: { maximum: 20 }
	validates :cook_time, presence: true
	validates :instructions, presence: true
	validate :is_title_case
	before_validation :make_title_case

	scope :top_rated, -> { left_joins(:reviews).group(:id).order('avg(stars) desc').limit(8) }
	scope :by_user, ->(user_id) { where(user: user_id) }

	# def self.by_user(user_id)
  #   where(user: user_id)
  # end

	def self.by_ingredient(ingredient_id)
		# ingredient = Ingredient.find_by(id: ingredient_id) 
		# ingredient.recipes	
		joins(:recipe_ingredients).where("recipe_ingredients.ingredient_id =?", ingredient_id)
	end

	def self.by_recipe_title(title)
		where("title LIKE ?", "%#{title}%")
		# "name LIKE ? OR postal_code LIKE ?", "%#{search}%", "%#{search}%"
	end

	def avg_rating
		# stars = []
		# self.reviews.each do |review|
		# 	stars << review.stars
		# end
		# avg_stars = (stars.sum(0.0) / stars.size).to_i
		Recipe.joins(:reviews).where("reviews.recipe_id =?", self.id).average(:stars).to_i
	end

	def empty_stars
		5 - avg_rating
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
  
