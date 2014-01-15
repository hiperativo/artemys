module ApplicationHelper
	def menu_items
		["Home", "Discover", "Collection", "Gallery", "Where to buy", "Contact"]
	end
	
	def m(string)
		Maruku.new(string).to_html.html_safe
	end

	def social_media_url(social_media)
		"http://www." + {
			"facebook" => "facebook.com",
			"twitter" => "twitter.com",
			"google-plus" => "googleplus.com"
		}[social_media]
	end
end
