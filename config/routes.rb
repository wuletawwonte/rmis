Rails.application.routes.draw do
  get 'proposals/index'
  get 'proposals/new'
  get 'proposals/create'
  get 'proposals/destroy'
  devise_for :users

  root "users#index"

  delete '/users/sign_out', to: 'users#sign_out'
end
