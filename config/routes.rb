# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  resources :profiles
  resources :faculties
  resources :departments
  resources :education_levels
  resources :academic_ranks
  resources :documents
  get 'subscribers/index'
  post 'subscribers/create', to: 'subscribers#create'
  get 'subscribers/edit/:id', to: 'subscribers#update', as: "toggle_subscriber"
  match "subscribers/verifyemail/:subscription_hash" => "subscribers#verify_email", as: "verify_email", via: :all
  get 'subscribers/email_verified', to: 'subscribers#email_verified', as: 'email_verified'
  
  resources :calls
  resources :research_types
  devise_for :users
  resources :themes, only: %i[index show create new edit destroy]
  resources :research_centers, only: %i[index show create new edit destroy]

  resources :proposals, only: %i[index show new create destroy] do
    resources :members, only: %i[ create ]
  end
  
  get '/my_profile', to: 'users#my_profile', as: "user_profile"
  get '/users/list', to: 'users#list', as: "users_list"
  get '/users/:id', to: 'users#show', as: "user"
  delete '/users/sign_out', to: 'users#sign_out'
  get '/users', to: redirect('/users/sign_up')
  get '/public/documents/list', to: 'documents#list', as: "documents_list"
  get 'search/researcher', to: 'proposals#search_researchers', as: "search_researchers"

  resources :calls do
    get '/page/:page', action: :index, on: :collection
    get '/public/show/:id', action: :public_show, as: :show_public, on: :collection
  end

  devise_scope :user do
    unauthenticated :user do
      root "calls#list"
    end

    authenticated :user do
      root "users#index", as: :authenticated_root
    end
  end

  mount Sidekiq::Web => '/sidekiq'

end
