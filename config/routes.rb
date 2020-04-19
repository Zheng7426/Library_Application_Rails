Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  devise_for :users,
             :controllers  => {
                 :registrations => 'users/registrations',
                 :sessions => 'users/sessions',
                 :passwords => 'users/passwords',
                 :unlocks => 'users/unlocks',
                 :confirmations => 'users/confirmations',
             }

  get '/bookmark' => 'books#bookmark', as: 'bookmark'
  get '/procurement-list' => 'books#procurement_list', as: 'list'
  resources :books do
      put :favorite, on: :member
      put :purchase, on: :member
      put :unpurchase, on: :member
      get :show
      resources :comments, only: [:create, :destroy]
  end
  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/internal' => 'books#internal', as: 'internal'
  get '/actions' => 'books#actions', as: 'book_actions'
  get '/promote' => 'books#promote', as: 'book_promote'
  get '/unpromote' => "books#unpromote", as: 'book_unpromote'
  get '/promption-list' => 'books#promotion_list', as: 'promo_list'


  namespace :api, defaults: { format: 'json' } do
    get 'books/search' => 'books#search'
    # post 'user_token' => 'user_token#create'
    # post 'find_user' => 'users#find'
    post :auth, to: "authentication#create"
    resources :users
    resources :books
  end
end
