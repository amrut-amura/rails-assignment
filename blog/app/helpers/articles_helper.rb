module ArticlesHelper
	def full_title(page_title)
		base title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
		base title
		else
		"#{base title} | #{page title}"
		end
	end
end
