Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root "videos#index"

  namespace :api do
    namespace :v1 do
      resources :comments, only: [:index, :show, :create]
    end
  end

  resources :videos, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :videos, only: [] do
    resources :comments, only: [:create]
  end
end
