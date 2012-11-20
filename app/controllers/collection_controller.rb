class CollectionController < ApplicationController
	def index
	end

	def show
		@collection = Collection.find_by_title params[:id].titleize
		@category = Category.find_by_title params[:category]
		unless @collection.blank?
			@pieces = if params[:category].nil? then @collection.pieces.all else @collection.pieces.where(category_id: @category.id) end
		end
	end
end
