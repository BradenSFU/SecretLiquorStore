Rails.application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "/drinks", to: 'drinks#show', as: "drink_search"
  get "/drinks/search", to: 'welcome#drinksearch', as: 'drink_results'

  get "/404", to: 'errors#not_found', as: "error_404"

  get "just_logged_in", to: 'welcome#just_logged_in', as: "just_logged_in"
  get "about_us", to: 'welcome#about_us', as: "about_us"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  root 'welcome#index'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
