Rails.application.routes.draw do
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" 
  get 'sessions/new'
  resources :contacts
  resources :favorites
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :blogs do
      collection do
      post :confirm
      end
    end
  root to: 'tops#index'
end