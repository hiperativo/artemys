class Collection < ActiveRecord::Base
	has_and_belongs_to_many :pieces
	attr_accessible :title
	def to_param
	  "#{id}-#{title.parameterize}"
	end
end
