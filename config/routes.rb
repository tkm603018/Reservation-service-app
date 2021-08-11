Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reservations, only: [:index, :new]
  resources :reservation_frames, only: [:index, :new, :create]
  resources :clients, only: [:show, :new, :create]
  resources :planners, only: [:index, :show, :new, :create]
  resources :sessions, only: [:create, :destroy]
end
