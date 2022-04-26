Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'

  # REFACTOR RESOURCES AND RETHINK IF /FUNDS, /MYFUNDERS, and /DREAMERSISUPPORT SHOULD BE SCOPES
  # resources :users, only: [:create, :show_dreams :as => :users_dreams, :show_investments :as => :user_funds, :show_my_funders, :show_dreamers_I_support] do
  #   resources :dreams 
  post '/users', to: 'users#create'
  get 'users/:id/dreams' => 'users#show_dreams', :as => :users_dreams
  get 'users/:id/funds' => 'users#show_investments', :as => :user_funds
  get 'users/:id/myfunders' => 'users#show_my_funders', :as => :show_my_funders
  get 'users/:id/dreamersIsupport' => 'users#show_dreamers_I_support', :as => :show_dreamers_I_support

  # creates a session between a cookie and a browser
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # Rails route helper
  resources :dreams

  root 'application#home'
  
end
