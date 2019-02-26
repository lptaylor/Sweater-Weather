Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: [:index]
      resources :users, only: [:create]
      resources :gifs, only: [:index]
      resources :sessions, only: [:create]
      resources :favorites, only: [:create, :index]
      delete '/favorites', to: 'favorites#destroy'
    end
  end
end
