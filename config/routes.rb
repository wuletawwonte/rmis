Rails.application.routes.draw do

  resources :proposals, only: [:index, :show, :new, :create]
  devise_for :users

  root "users#index"

  delete '/users/sign_out', to: 'users#sign_out'
end
