Artemys::Application.routes.draw do
  
	devise_for :users
	mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

	resources :collection do
		post "sort", on: :collection
	end

	resources :pieces do
		get "edit", on: :collection
		post "upload_photo", on: :collection
	end

	get "be-a-reseller" => "pages#be_a_reseller"
	get "where-to-buy" => "pages#where_to_buy"
	get "gallery" => "gallery#index"
	get ":action" => "pages"
	root :to => "pages#home"
end