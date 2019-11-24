Rails.application.routes.draw do
  resources :books
  namespace :api do
  	namespace :v do
  		post "/search" => "search#get_info_books"
  	end
  end
end
