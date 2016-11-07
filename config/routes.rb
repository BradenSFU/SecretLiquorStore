Rails.application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "/searchdrink", to: 'welcome#drink', as: "drink_search"
  get "/404", to: 'errors#not_found', as: "error_404"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"


  root 'welcome#index'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
