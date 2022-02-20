Rails.application.routes.draw do
  get 'sessions/new'
  resources :contacts
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :blogs do
      collection do
      post :confirm
      end
    end
  root to: 'tops#index'
end