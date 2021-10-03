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


	def self.by_ingredient(ingredient_id)
		joins(:recipe_ingredients).where("recipe_ingredients.ingredient_id =?", ingredient_id)
	end

	def self.by_recipe_title(title)
		where("title ILIKE ?", "%#{title}%")
	end

	def avg_rating
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
  
