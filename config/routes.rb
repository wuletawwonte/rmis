# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :profiles
  resources :documents

  namespace :admin do
    resources :users
    resources :academic_ranks
    resources :education_levels
    resources :departments
    resources :faculties
    resources :profiles
    resources :documents
    resources :research_centers
    resources :themes
    resources :research_types
    resources :proposals, only: %i[index destroy]
    resources :subscribers, only: %i[index create update]
    resources :global_settings, only: %i[index update]

    root to: 'users#index'
  end

  resources :calls
  resources :research_types
  devise_for :users
  resources :themes, only: %i[index show]
  resources :research_centers

  resources :proposals, only: %i[index show new create destroy] do
    get '/members', to: 'members#create', as: 'members'
    get '/members/:id', to: 'members#accept_envitation', as: 'accept_envitation'
    delete '/members/:id', to: 'members#decline_envitation', as: 'decline_envitation'
  end

  get '/my_profile', to: 'users#my_profile', as: 'user_profile'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: redirect('/users/sign_up')
  get '/public/documents/list', to: 'documents#list', as: 'documents_list'
  get '/search/researcher', to: 'proposals#search_researchers', as: 'search_researchers'
  match 'subscribers/verifyemail/:subscription_hash' => 'subscribers#verify_email', as: 'verify_email', via: :all
  get 'subscribers/email_verified', to: 'subscribers#email_verified', as: 'email_verified'

  resources :calls do
    get '/page/:page', action: :index, on: :collection
    get '/public/show/:id', action: :public_show, as: :show_public, on: :collection
  end

  devise_scope :user do
    unauthenticated :user do
      root 'calls#list'
    end

    authenticated :user do
      root 'dashboards#index', as: :authenticated_root
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
