class Place < ActiveRecord::Base
  attr_accessible :city, :country, :localization, :state, :store, :address
end
