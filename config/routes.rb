# frozen_string_literal: true

Rails.application.routes.draw do
  resources :themes, only: %i[index show create new edit destroy]
  resources :research_centers, only: %i[index show create new edit destroy]
  resources :proposals, only: %i[index show new create destroy]
  devise_for :users

  root 'users#index'

  delete '/users/sign_out', to: 'users#sign_out'
end
