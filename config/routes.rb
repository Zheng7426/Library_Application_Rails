Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'users/destroy'
  # resources :users, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]
  get '/signup' => 'users#new', as: 'signup'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/bookmark' => 'books#bookmark', as: 'bookmark'
  get '/procurement-list' => 'books#procurement_list', as: 'list'
  resources :books do
      put :favorite, on: :member
      put :purchase, on: :member
      resources :comments, only: [:create, :destroy]
  end
  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
