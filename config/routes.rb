Rails.application.routes.draw do
root 'users#index'


resources :users, only: [:index, :new, :create]

resources :sessions, only: [:new, :create, :destroy]
get '/login' => 'sessions#new'
end
