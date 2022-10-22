# frozen_string_literal: true

Rails.application.routes.draw do
  get 'members/create'
  resources :themes, only: %i[index show create new edit destroy]
  resources :research_centers, only: %i[index show create new edit destroy]
  resources :proposals, only: %i[index show new create edit destroy]
  devise_for :users

  root 'users#index'

  delete '/users/sign_out', to: 'users#sign_out'
  get '/users', to: redirect('/users/sign_up')

end
