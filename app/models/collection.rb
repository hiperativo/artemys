class Collection < ActiveRecord::Base
	has_and_belongs_to_many :pieces
	attr_accessible :title
	def to_param
	  "#{id}-#{title.parameterize}"
	end

	attr_accessor :catalogue_path

	def catalogue_url
		case self.title
		when "USA", "Ecuador"
			"https://www.facebook.com/media/set/?set=a.358980027474116.79320.181607861878001&type=3"

		when "Venezuela"
			"https://www.facebook.com/media/set/?set=a.471241669581284.103933.181607861878001&type=3"
		end
	end
end
