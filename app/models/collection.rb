class Collection < ActiveRecord::Base
	has_many :pieces
	attr_accessible :title
end
