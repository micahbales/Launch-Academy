Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :stations do
    resources :reviews, except: :destroy
  end
  resources :votes, only: [:create]

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :stations, only: :destroy
    resources :reviews, only: :destroy
  end

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create]
    end
  end
end
