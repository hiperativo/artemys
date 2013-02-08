class GalleryController < ApplicationController
	def index
		@category = Category.find_by_title params[:category]
		@media = GalleryItem.all
		
		# @media = if params[:category].nil? then Media.all else Media.where(category_id: @category.id) end
	end
end