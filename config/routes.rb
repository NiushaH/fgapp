Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  # creates a session between a cookie and a browser
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # Rails route helper
  resources :dreams

  root 'application#home'
  
end
