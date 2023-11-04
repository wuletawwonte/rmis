# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  authenticated :user, lambda { |u| u.admin? } do
    namespace :admin do
      resources :users
      resources :academic_ranks
      resources :education_levels
      resources :departments
      resources :faculties
      resources :documents
      resources :research_centers
      resources :themes
      resources :research_types
      resources :calls
      resources :proposals, only: %i[index destroy]
      resources :subscribers, only: %i[index create update]
      resources :global_settings, only: %i[index show update]

      mount Sidekiq::Web => "/sidekiq"

      root "users#index"
    end
  end

  devise_for :users
  resources :calls, only: %i[index show]
  resources :documents, only: %i[index]
  resources :profiles
  resources :research_types
  resources :themes, only: %i[index show]
  resources :research_centers

  resources :proposals do
    get "/members", to: "members#create", as: "members"
    get "/members/:id", to: "members#accept_envitation", as: "accept_envitation"
    delete "/members/:id", to: "members#decline_envitation", as: "decline_envitation"
  end

  get "/my_profile", to: "users#my_profile", as: "user_profile"
  get "/search/researcher", to: "proposals#search_researchers", as: "search_researchers"
  match "subscribers/verifyemail/:subscription_hash" => "subscribers#verify_email", :as => "verify_email", :via => :all
  get "subscribers/email_verified", to: "subscribers#email_verified", as: "email_verified"

  unauthenticated :user do
    root "calls#index"
  end

  authenticated :user do
    root "dashboard#index", as: :user_root
  end
end
