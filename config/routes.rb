Artemys::Application.routes.draw do
	match "be-a-reseller" => "pages#be_a_reseller"
	match "where-to-buy" => "pages#where_to_buy"
	match ":action" => "pages"
	root :to => "pages#home"
end
