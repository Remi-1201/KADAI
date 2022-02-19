Rails.application.routes.draw do
  resources :feeds
  get 'sessions/new'
  resources :favorites
  resources :contacts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs do
      collection do
      post :confirm
      end
    end
  root to: 'tops#index'
end