Rails.application.routes.draw do
  root to: 'users#new'
  resources :users, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
