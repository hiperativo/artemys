class Place < ActiveRecord::Base
	attr_accessible :city, :country, :localization, :state, :store, :address

	attr_accessor :states

	def self.states
		where("address IS NOT NULL").select("DISTINCT state").collect(&:state)
	end

end
