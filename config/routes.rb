Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
<<<<<<< HEAD
      resources :images, only: [:index]
=======
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :favorites, only: [:create, :index]
      delete '/favorites', to: 'favorites#destroy'
>>>>>>> fe69654907250f1ed38bca68ebb434f1a54bddc5
    end
  end
end
