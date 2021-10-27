Rails.application.routes.draw do
  get 'search/index'
  get 'home/index'
  get 'search' => 'search#index'
  
  devise_for :users
  devise_for :accounts
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
