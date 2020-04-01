Rails.application.routes.draw do
  resources :books do
    resources :comments
  end
  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
