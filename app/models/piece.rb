class Piece < ActiveRecord::Base
	belongs_to :category
	belongs_to :collection
	attr_accessible :image, :image_cache, :image_url, :title, :category_id, :collection_id, :remove_image
	mount_uploader :image, PhotoUploader

	attr_accessor :unique_categories

	def self.unique_categories
		select("DISTINCT category_id").collect(&:category)
	end
end
