Rails.application.routes.draw do
  resources :orders, only: [:show, :index, :destroy]
  resources :users
  resources :items
  resources :items do
    resources :orders, only: [:new, :create, :show, :index, :destroy]
  end
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
