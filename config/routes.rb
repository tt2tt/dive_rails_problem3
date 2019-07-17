Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
