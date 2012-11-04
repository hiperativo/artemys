class Contact < ActiveRecord::Base
  attr_accessible :country, :email, :message, :name, :subject
end
