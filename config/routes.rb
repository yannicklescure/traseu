Rails.application.routes.draw do
  devise_for :users
  root to: 'itineraries#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :itineraries, only: [ :new, :create, :show ]
  get '/search', to: 'itineraries#search', as: 'search_itineraries'
  get '/pages', to: 'pages#home'

  resources :itinaries_cities, only: [ :destroy, :create ]
  resources :itinaries_spots, only: [ :destroy, :create ]
  resources :cities, only: [ :show ]

end
