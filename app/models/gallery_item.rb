class GalleryItem < ActiveRecord::Base
  attr_accessible :image, :image_url, :image_cache, :video, :gallery_category_id, :remove_image
  mount_uploader :image, MediaUploader

  # has_many :media_categorizations
  belongs_to :gallery_category
end
