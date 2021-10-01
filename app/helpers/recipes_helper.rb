module RecipesHelper

  def submitted_on(recipe)
    recipe.created_at.strftime("on %A, %b %e")
  end

end
