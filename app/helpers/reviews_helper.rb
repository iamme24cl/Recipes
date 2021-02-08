module ReviewsHelper

	def display_heading(object)
		if object
			content_tag(:h1, "Reviews for #{object.title}")
		else
			content_tag(:h1, "All Reviews")
		end
	end
end
