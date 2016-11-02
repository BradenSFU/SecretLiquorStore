Rails.application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"

  root 'welcome#index'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
