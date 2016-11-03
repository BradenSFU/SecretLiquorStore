Rails.application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "/searchdrink", to: 'welcome#drink', as: "drink_search"
  get "/404", to: 'errors#not_found', as: "error_404"

  root 'welcome#index'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
