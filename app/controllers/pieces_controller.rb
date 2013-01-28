class PiecesController < ApplicationController
	def show
		@piece = Piece.find params[:id]
		@description = @piece.try("description_#{I18n.locale}".to_sym) || "There isn't a description for this piece yet."
		render layout: "basic"
	end

	def sort
		render json: {status: "success"}
	end

end
