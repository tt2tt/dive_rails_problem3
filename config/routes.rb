Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'users#new'
  resources :users, only: [:new, :create, :show, :destroy]
end
