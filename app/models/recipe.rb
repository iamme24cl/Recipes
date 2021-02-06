class Recipe < ApplicationRecord
	has_many :reviews
	has_many :users, through: :reviews
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients


	validates :title, presence: true
	validates :cook_time, presence: true
	validates :instructions, presence: true

end
