Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  resources :reservations
  post "reservations/new" => "reservations#new"
end
