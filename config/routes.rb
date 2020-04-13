Rails.application.routes.draw do
  devise_for :users
  # get 'users/new'
  # get 'users/create'
  # get 'users/destroy'
  # resources :users, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]
  # get '/signup' => 'users#new', as: 'signup'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # resources :sessions, only: [:new, :create, :destroy]

  # get '/login' => 'sessions#new', as: 'login'
  # delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/bookmark' => 'books#bookmark', as: 'bookmark'
  get '/procurement-list' => 'books#procurement_list', as: 'list'
  resources :books do
      put :favorite, on: :member
      put :purchase, on: :member
      resources :comments, only: [:create, :destroy]
  end
  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/internal' => 'books#internal', as: 'internal'
  get '/actions' => 'books#actions', as: 'book_actions'
  get '/promote' => 'books#promote', as: 'book_promote'
  get '/promption-list' => 'books#promotion_list', as: 'promo_list'
end
