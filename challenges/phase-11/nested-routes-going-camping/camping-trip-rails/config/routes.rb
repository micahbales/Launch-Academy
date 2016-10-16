Rails.application.routes.draw do

  resources :campsites, only: [:index, :show] do
    resources :campers, only: [:index]
  end
  resources :campers, only: [:index, :show] do
    resources :supplies, only: [:index]
  end
  resources :supplies, only: [:index]
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :campers, only: [:index]
    end
  end
end
