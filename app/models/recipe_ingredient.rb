class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, presence: true

  def ingredient_attributes=(attributes)
  	binding.pry
  	ingredient = Ingredient.find_or_create_by(attributes) if !attributes['name'].blank?
  end
end
