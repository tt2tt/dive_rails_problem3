Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end

end
