Rails.application.routes.draw do
root 'homepage#index'
get '/home' => 'homepage#index'

resources :teams
resources :users do
  resources :posts
end

resources :sessions, only: [:new, :show, :create, :destroy, :edit ]

get '/login' => 'sessions#new'

get '/users/:id/edit/' => 'sessions#edit'
end
