Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'
  # REFACTOR RESOURCES AND RETHINK IF /FUNDS, /MYFUNDERS, and /DREAMERSISUPPORT SHOULD BE SCOPES
  # resources :users, only: [:create, :show_dreams :as => :users_dreams, :show_investments :as => :user_funds, :show_my_funders, :show_dreamers_I_support] do
  #   resources :dreams 
  post '/users', to: 'users#create'
  get '/users/reset_password', to: 'users#reset_form'
  post '/users/reset_password', to: 'users#password_reset'

  # directs auth callback response to SessionsController omniauth action with params[:provider] set to google_oauth2
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  # creates a session between a cookie and a browser
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # Rails route helper
  resources :dreams, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  get 'users/:id' => 'users#show', :as => :show_dreamer

  # For live coding session assessment
  get 'orderAtoZ' => 'users#orderAtoZ', :as => :orderAtoZ

  # Refactor for fun if want to use user_ as path prefix with
  #  scope '/users', module: 'user' do
  resources :users, only: [:show, :edit, :update] do
    resources :dreams, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  
  get 'users/:id/' => 'users#show', :as => :show_funder
  get 'users/:id/mydreams' => 'users#show_all_user_dreams', :as => :user_dreams_index
  get 'users/:id/funds' => 'users#show_investments', :as => :user_funds
  get 'users/:id/funders' => 'users#show_funders', :as => :funders
  get 'users/:id/funded' => 'users#show_dreamers_I_funded', :as => :show_dreamers_I_funded

  root 'application#home'
  
end
