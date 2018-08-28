Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  get '/users', to: 'users#index'
  root to:'tweets#index'

  resources :tweets, only: [:index, :new, :edit, :create, :update, :destroy]
end
