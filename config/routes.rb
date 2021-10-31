Rails.application.routes.draw do
  get 'search/index'
  get 'home/index'
  get 'posts/new'
  get 'search' => 'search#index'

  # halaman utama
  root to: "auth#form_login"

  # register
  get '/daftar', to: 'auth#form_register', as: 'form_register'
  post '/daftar', to: 'auth#register', as: 'register_post'

  # login
  get '/login', to: 'auth#form_login', as: 'form_login'
  post '/login', to: 'auth#login', as: 'login_post'

  # logout
  delete '/logout/:id', to: 'auth#logout', as: 'user_logout'
  
  devise_for :users
  devise_for :accounts
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
