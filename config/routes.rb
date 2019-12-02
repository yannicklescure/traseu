Rails.application.routes.draw do
  devise_for :users
  root to: 'searches#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :searches, only: [ :index, :new, :create ]

  resources :itineraries, only: [ :new, :create, :show, :destroy ]
  # get '/search', to: 'itineraries#search', as: 'search_itineraries'
  # resources :bookmarks, only: [ :index, :destroy, :create ]
  get '/bookmarks', to: 'bookmarks#index', as: 'bookmarks'
  # post '/bookmarks', to: 'bookmarks#bookmark'
  delete '/bookmarks', to: 'bookmarks#destroy'
  get '/pages', to: 'pages#home'
  
  resources :itinaries_cities, only: [ :destroy, :create ]
  resources :itinaries_spots, only: [ :destroy, :create ]
  resources :cities, only: [ :show ]
end
