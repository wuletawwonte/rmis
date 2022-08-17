# frozen_string_literal: true

Rails.application.routes.draw do
  resources :research_centers, only: %i[index show create new edit destroy]
  resources :proposals, only: %i[index show new create]
  devise_for :users

  root 'users#index'

  delete '/users/sign_out', to: 'users#sign_out'
end
