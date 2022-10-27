# frozen_string_literal: true

Rails.application.routes.draw do
  resources :research_types
  devise_for :users
  resources :themes, only: %i[index show create new edit destroy]
  resources :research_centers, only: %i[index show create new edit destroy]
  resources :proposals, only: %i[index show new create edit destroy]
  
  get 'members/create'
  delete '/users/sign_out', to: 'users#sign_out'
  get '/users', to: redirect('/users/sign_up')

  devise_scope :user do
    unauthenticated :user do
      root "devise/sessions#new"
    end

    authenticated :user do
      root "users#index", as: :authenticated_root
    end
  end

end
