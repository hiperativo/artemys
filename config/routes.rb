Artemys::Application.routes.draw do
	mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
	devise_for :users

	resources :collection do
		post "sort", on: :collection
	end

	resources :pieces

	match "be-a-reseller" => "pages#be_a_reseller"
	match "where-to-buy" => "pages#where_to_buy"
	match "gallery" => "media#index"
	match ":action" => "pages"
	root :to => "pages#home"
end