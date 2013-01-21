class CollectionController < ApplicationController
	def index
	end

	def show
		@collection = Collection.find_by_title(params[:id].titleize)
		@categorias = @collection.pieces.unique_categories
		@pieces = @collection.pieces.order("ordem ASC")
	end

	def sort
		for sort_params in [params["category-id"], params["piece-id"]] do
			unless sort_params.nil?
				sort_params.each_with_index do |id, ordem|
					the_model = case sort_params
						when params["category-id"] then Category
						when params["piece-id"] then Piece
					end
					the_model.update_all ["ordem = ?", ordem], ["id = ?", id]
				end
			end
		end

		render text: "done"
	end

end
