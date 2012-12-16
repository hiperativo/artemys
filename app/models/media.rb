class Media < ActiveRecord::Base
  attr_accessible :image, :image_url, :image_cache, :video
  mount_uploader :image, PhotoUploader
end
