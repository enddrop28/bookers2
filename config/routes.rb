Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'homes_about'
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit, :update, :index, :create, :update]
  post '/users/:id' => 'users#show'

end