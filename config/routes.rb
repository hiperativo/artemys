Artemys::Application.routes.draw do
  get "gallery/index"

	match "be-a-reseller" => "pages#be_a_reseller"
	match "where-to-buy" => "pages#where_to_buy"
	match "collection" => "collection#index"
	match "collection/:collection" => "pieces#index"
	match "gallery" => "gallery#index"
	match ":action" => "pages"
	root :to => "pages#home"
end