module ApplicationHelper
	def menu_items
		["Home", "Discover", "Collection", "Gallery", "Where to buy", "Contact"]
	end
	def m(string)
		Maruku.new(string).to_html.html_safe
	end
end
