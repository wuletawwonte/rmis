Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  delete '/users/sign_out', to: 'users#sign_out'
end
