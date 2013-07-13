class Piece < ActiveRecord::Base
	belongs_to :category
	has_and_belongs_to_many :collections
	attr_accessible :image, :watermark, :image_cache, :image_url, :title, :category_id, :remove_image, :collection_ids, :category_id
	mount_uploader :image, PhotoUploader

	after_save :set_code

	# attr_accessor :unique_categories

	# after_update :update_watermark, if: :watermark_changed

	# def watermark_changed
	# 	# Check if the watermark changed
	# 	self.watermark_changed?
	# end

	# def update_watermark
	# 	self.image.recreate_versions!
	# end

	def set_code
		if self.title.blank?
			self.title = self.image.identifier.split(".")[0]
			self.save
		end
	end

	def self.unique_categories
		Category.where(id: [select("DISTINCT category_id").collect(&:category).collect(&:id)]).order("ordem ASC")
	end

	# accepts_nested_attributes_for :collections, :allow_destroy => true
	# attr_accessible :collections_attributes

	rails_admin do
		configure :collections do
			inverse_of :pieces
		end
	end

end
