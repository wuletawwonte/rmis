# frozen_string_literal: true

Rails.application.routes.draw do
  get 'subscribers/index'
  resources :calls
  resources :research_types
  devise_for :users
  resources :themes, only: %i[index show create new edit destroy]
  resources :research_centers, only: %i[index show create new edit destroy]
  resources :proposals, only: %i[index show new create edit destroy]
  
  get 'members/create'
  delete '/users/sign_out', to: 'users#sign_out'
  get '/users', to: redirect('/users/sign_up')

  resources :calls do
    get '/page/:page', action: :index, on: :collection
    get '/public/show/:id', action: :public_show, on: :collection
  end

  devise_scope :user do
    unauthenticated :user do
      root "calls#list"
    end

    authenticated :user do
      root "users#index", as: :authenticated_root
    end
  end

end
