class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  # accepts_nested_attributes_for :ingredient, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :quantity, presence: true

  def ingredient_attributes=(ingredient_attributes)
  	self.ingredient = Ingredient.find_or_create_by(ingredient_attributes) if !ingredient_attributes['name'].blank?
  end
end
