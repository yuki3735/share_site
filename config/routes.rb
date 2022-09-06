Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users
  resources :rooms
  resources :reservations
  post "reservations/new" => "reservations#new"
  post "rooms/search" => "rooms#search"
  post "rooms/result" => "rooms#result"
  resources :users do
    collection do
      get 'search'
    end
  end
end
