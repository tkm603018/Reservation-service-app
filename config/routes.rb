Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Client側
  get 'reservations/index', to: 'reservations#index'
  get 'clients/sign_up', to: 'clients#create'
  get 'clients/sign_in', to: 'clients#new'
  get 'clients/profile', to: 'clients#show'
  get 'planners/index', to: 'planners#index'
  get 'planners/:id', to: 'planners#show'
  get 'reservations/new', to: 'reservations#new'
  
  #Planner側
  get 'reservation_frames/index', to: 'reservation_frames#index'
  get 'planners/sign_up', to: 'planners#create'
  get 'planners/sign_in', to: 'planners#new'
  get 'planners/profile', to: 'clients#show'
  get 'reservation_frames/new', to: 'reservation_frames#new'

end
