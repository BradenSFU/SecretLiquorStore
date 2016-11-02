Rails.application.routes.draw do
  get 'change_password/change'

  get 'change_password/success'

  get "log_in" => "sessions#new", :as => "log_in"
  
  match ':controller(/:action(/:id))', :via => :get

  match ':controller(/:action(/:id))', :via => :post

  root 'welcome#index'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
