Rails.application.routes.draw do
  resources :pictures
  root to: 'users#new'
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
