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
		# @lojas_venezuela = SmarterCSV.process (Rails.root.join "app", "assets", "csv", "lojas-venezuela.csv"), { col_sep:';'}
		# @states, @cities = {}
		# for store in @lojas_venezuela
		# 	unless @states[store[:state]]
		# 		@states[store[:state]] = {}
		# 		unless @states[store[:state]][store[:city]]
		# 			@states[store[:state]][store[:city]] = {}
		# 		end
		# 	end
		# 	@states[store[:state]][store[:city]] = store
		# end
	end
	
	def places
		# @lojas_venezuela ||= SmarterCSV.process (Rails.root.join "app", "assets", "csv", "lojas-venezuela.csv"), { col_sep:';'}
		
		# @states, @cities = {}
		# for store in @lojas_venezuela
		# 	unless @states[store[:state]]
		# 		@states[store[:state]] = {}
		# 		unless @states[store[:state]][store[:city]]
		# 			@states[store[:state]][store[:city]] = {}
		# 		end
		# 	end
		# 	@states[store[:state]][store[:city]] = store
		# end

		# respond_to do |format|
		# 	format.json { render :json => @states}
		# 	format.xml
		# end
	end

	def contact
	end

	def be_a_reseller
	end

end
