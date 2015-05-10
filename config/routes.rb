Rails.application.routes.draw do

  devise_for :users

  resources :reservations, only: [:index, :create, :destroy]

  root to: 'reservations#index'
end
