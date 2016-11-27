Rails.application.routes.draw do
  resources :likes
  resources :publishes
  resources :users
  resources :sessions

  #Sessions
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  #Drinks
  get "/drinks/searched" => 'drinks#drinksearch', as: 'drink_search'
  get "/drinks/show", to: 'drinks#show', as: "drink_show"
  match "/drinks/search", to: 'drinks#drinkresults', as: 'drink_results', via: [:get, :post]

  #Errors
  get "/404", to: 'errors#not_found', as: "error_404"

  #Other pages
  root 'welcome#index'
  get "just_logged_in", to: 'welcome#just_logged_in', as: "just_logged_in"
  get "about_us", to: 'welcome#about_us', as: "about_us"

  #Change/Reset Password
  get "change_password" => "change_password#change", :as => "change_password"
  post "change_password" => "change_password#change", :as => "change_password/success"
  get "reset_password" => "change_password#reset", :as => "reset_password"
  post "reset_password" => "change_password#reset", :as => "reset_password/success"

  #Manage likes and dislikes
  post '/likes' => 'likes#create', as: :like_create
  post '/dislikes' => 'likes#dislike', as: :dislike_create

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
