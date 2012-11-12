class Piece < ActiveRecord::Base
	belongs_to :category
	belongs_to :collection
	attr_accessible :image_url, :image_url_cache, :title, :category_id, :collection_id
	mount_uploader :image_url, PhotoUploader
end
