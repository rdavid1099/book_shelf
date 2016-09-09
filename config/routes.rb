Rails.application.routes.draw do

  root to: "users#dashboard"

  resources :users, only: [:new, :create, :show] do
    resources :books
  end

  namespace :admin do
    resources :books
  end

  post '/books', to: 'admin/books#create'
  patch '/book/:id', to: 'admin/books#update', as: "book"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
