Rails.application.routes.draw do

  resources :users
  resources :sessions
  resources :likes

  resources :publishes do
    member do
      post 'add_like'
      post 'add_dislike'
      post 'delete_vote'
      post 'api_add_like'
      post 'api_add_dislike'
      post 'api_create_publish'
    end
  end

  # Drink API likes and dislikes
  get "publishes/:id/api_drink_add_like" => "publishes#api_drink_add_like"
  get "publishes/:id/api_drink_add_dislike" => "publishes#api_drink_add_dislike"

  # Ingredient Search
  get 'ingred_search' => 'ingred_search#show'
  match  '/ingreds/results', to: 'ingred_search#pagehandler', as: 'ingred_page', via: [:get, :post]
  get "/ingreds/search", to: 'ingred_search#ingredstartsearch', as: 'ingred_startsearch'

  # Sessions
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  # Edit profile
  get "edit_bio" => "edit_profile#edit_bio", :as => "edit_bio"
  get 'edit_profile/edit_bio'
  get 'edit_profile/edit_email_profile'

  # Password configuration
  get "change_password" => "change_password#change", :as => "change_password"
  post "change_password" => "change_password#change", :as => "change_password/success"
  get "reset_password" => "change_password#reset", :as => "reset_password"
  post "reset_password" => "change_password#reset", :as => "reset_password/success"

  # Drinks
  get "/drinks/searched" => 'drinks#drinksearch', as: 'drink_search'
  get "/drinks/show", to: 'drinks#show', as: "drink_show"
  match "/drinks/search", to: 'drinks#drinkresults', as: 'drink_results', via: [:get, :post]

  # Errors
  get "/404", to: 'errors#not_found', as: "error_404"

  # Other pages
  root 'welcome#index'
  get "just_logged_in", to: 'welcome#just_logged_in', as: "just_logged_in"
  get "about_us", to: 'welcome#about_us', as: "about_us"

  get 'liquorsearch' => 'mapsearch#liquorsearch'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
