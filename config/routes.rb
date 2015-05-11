Rails.application.routes.draw do

  devise_for :users

  resources :reservations, only: [:index, :create, :destroy]

  authenticated :user do
    root to: 'reservations#index', :as => :authenticated_root
  end
  
  root :to => redirect('/users/sign_in')

end
