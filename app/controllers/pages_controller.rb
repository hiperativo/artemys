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
        @places = Place.all
    end
    
    def places
        @states, @cities = {}
        for place in Place.all
            # if place.address.blank? then break end
            @states[place[:state]] ||= {}
            @states[place[:state]][place[:city]] ||= []
            @states[place[:state]][place[:city]] << place 
        end

        respond_to do |format|
            format.json { render :json => @states }
        end
    end

    def contact
    end

    def be_a_reseller

    end

    def send_contact
        @contact = Contact.create params[:contact]
        UserMailer.contact_notification(@contact).deliver
        redirect_to action: "home"
    end

end
