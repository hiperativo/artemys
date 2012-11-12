class Collection < ActiveRecord::Base
	has_many :pieces
	attr_accessible :title
	def to_param
	  "#{id}-#{title.parameterize}"
	end
end
