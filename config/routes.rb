Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'

  # REFACTOR RESOURCES AND RETHINK IF /FUNDS, /MYFUNDERS, and /DREAMERSISUPPORT SHOULD BE SCOPES
  # resources :users, only: [:create, :show_dreams :as => :users_dreams, :show_investments :as => :user_funds, :show_my_funders, :show_dreamers_I_support] do
  #   resources :dreams 
  post '/users', to: 'users#create'

  # creates a session between a cookie and a browser
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # Rails route helper
  resources :dreams
  get 'users/:id' => 'users#show', :as => :show_dreamer

  resources :users, only: [:show, :edit, :update] do
    resources :dreams, only: [:new, :show, :edit, :update, :destroy]
  end
  get 'users/:id/' => 'users#show', :as => :show_funder
  get 'users/:id/mydreams' => 'users#show_all_user_dreams', :as => :user_dreams_index
  get 'users/:id/funds' => 'users#show_investments', :as => :user_funds
  get 'users/:id/funders' => 'users#show_funders', :as => :funders
  get 'users/:id/funded' => 'users#show_dreamers_I_funded', :as => :show_dreamers_I_funded

  root 'application#home'
  
end
