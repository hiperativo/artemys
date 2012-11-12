class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :pieces
	def to_param
	  "#{id}-#{title.parameterize}"
	end
end
