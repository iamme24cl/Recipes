module ReviewsHelper

	def display_heading(object)
		if object
			content_tag(:h1, "Reviews for #{object.title}")
		else
			content_tag(:h1, "All Reviews")
		end
	end

	def go_back(object)
		if object
			link_to "Back", recipe_path(object), class: "btn btn-primary"
		else
			link_to "Back", recipes_path, class: "btn btn-primary"
		end
	end
end
