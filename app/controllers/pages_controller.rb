# encoding: UTF-8
class PagesController < ApplicationController
	def home
	end

	def discover
	end

	def collection
	end

	def gallery
	end

	def where_to_buy
		@states = Place.states
	end
	
	def places
		@states, @cities = {}
		for store in Place.all
			if store.address.blank? then break end
		 	@states[store[:state]] ||= {}
		 	@states[store[:state]][store[:city]] ||= []
			@states[store[:state]][store[:city]] << store 
		end

		respond_to do |format|
			format.json { render :json => @states }
		end
	end

	def contact
	end

	def be_a_reseller
	end

end
