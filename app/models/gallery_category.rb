class GalleryCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :gallery_items
end
