class GalleryItem < ActiveRecord::Base
	attr_accessible :image, :image_url, :image_cache, :video, :gallery_category_id, :remove_image
	mount_uploader :image, MediaUploader

	# has_many :media_categorizations
	belongs_to :gallery_category

	attr_accessor :youtube_thumbnail, :youtube_code, :youtube_thumbnail

	def youtube_code
		# /.*v=(.*)&/.match(self.video)[1] || "lol"
		/.*v=(.*)&*/.match(self.video)[1]
		# self.video
	end

	def youtube_pure_video
		"http://www.youtube.com/v/#{self.youtube_code}"
	end

	def youtube_embed
		"<iframe width='560' height='315' src='http://www.youtube.com/embed/#{self.youtube_code}' frameborder='0' allowfullscreen></iframe>".to_html
	end

	def youtube_thumbnail
		"http://img.youtube.com/vi/#{self.youtube_code}/0.jpg"
	end

end
