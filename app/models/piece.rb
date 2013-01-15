class Piece < ActiveRecord::Base
	belongs_to :category
	belongs_to :collection
	attr_accessible :image, :image_cache, :image_url, :title, :category_id, :collection_id, :remove_image, :watermark
	mount_uploader :image, PhotoUploader

	attr_accessor :unique_categories

	after_update :update_watermark, if: :watermark_changed

	def watermark_changed
		# Check if the watermark changed
		self.watermark_changed?
	end

	def update_watermark
		self.image.recreate_versions!
	end

	def self.unique_categories
		select("DISTINCT category_id").collect(&:category)
	end
end
