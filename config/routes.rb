Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'dragon/new'
  get 'resource/new'
  get 'dragon_types/index'
  root 'dragon_types#index'

  resources :dragon_types
  resources :resource_types

  namespace :user do
    root to: 'profile#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
