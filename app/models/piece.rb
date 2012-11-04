class Piece < ActiveRecord::Base
	belongs_to :collection
	attr_accessible :image_url, :title
end
