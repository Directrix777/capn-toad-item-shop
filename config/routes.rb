Rails.application.routes.draw do
  resources :orders
  resources :users
  resources :items
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#new'
  get '/toggle/:id', to: 'users#show_toggle'
  post '/toggle/:id', to: 'users#toggle'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
