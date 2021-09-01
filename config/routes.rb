Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'reservations#index'
  resources :reservations, only: [:index, :new, :create, :destroy]
  resources :reservation_frames, only: [:index, :new, :create, :destroy, :update]
  resources :clients, only: [:show, :new, :create]
  resources :planners, only: [:index, :show, :new, :create]
  resources :sessions, only: [:create, :destroy]
  resource :user_profile, only: [:show]
end
