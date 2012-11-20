class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :set_locale

	def set_locale
		unless params[:language].nil?
			I18n.locale = params[:language]
		end
	end
end
