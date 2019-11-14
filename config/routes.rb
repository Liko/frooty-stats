Rails.application.routes.draw do

  resources :users
  resources :matches
  resources :players
  resources :clubs
  resources :favourites
  resources :countries
  resources :positions
  resources :competitions
  resources :stadia
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/logout' => 'sessions#destroy'

  root 'home#today'

end
