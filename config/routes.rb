Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users
  #root 'users#index'
  get '/user_profile', to: 'users#user_profile'

  resources :books do
    resources :comments do
      resources :likes
    end
  end
end
