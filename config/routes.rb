Rails.application.routes.draw do
root 'users#index'

resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy]

resources :sessions, only: [:new, :show, :create, :destroy, :edit ]

get '/login' => 'users#new'

get '/users/:id/edit/' => 'sessions#edit'
end
