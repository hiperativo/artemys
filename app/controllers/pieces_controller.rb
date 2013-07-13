class PiecesController < ApplicationController
	def show
		@piece = Piece.find params[:id]
		@description = @piece.try("description_#{I18n.locale}".to_sym) || "There isn't a description for this piece yet."
		render layout: "basic"
	end

	def sort
		render json: { status: "success"}
	end

	def edit
		@pieces = Piece.order(:created_at)
	end

	def update
		Piece.find(params[:id]).update_attributes params[:piece]
		render json: params, status: 200
	end

	def upload_photo
		uploaded_file = params["file"]
		p = Piece.new
		p.image = uploaded_file
		p.save
		render json: p, status: "200"
	end

	def edit_multiple
	end
end
