Rails.application.routes.draw do
  resources :matches
  resources :players
  resources :clubs
  resources :countries
  resources :positions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
