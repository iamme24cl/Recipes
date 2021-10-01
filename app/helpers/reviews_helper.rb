module ReviewsHelper

	def display_heading(object)
		if object
			content_tag(:h1, "Reviews for #{object.title}")
		else
			content_tag(:h1, "All Reviews")
		end
	end

	def go_back(recipe)
		if recipe
			link_to "Back", recipe_path(recipe), class: "btn btn-dark"
		else
			link_to "Back", recipes_path, class: "btn btn-dark"
		end
	end
end
