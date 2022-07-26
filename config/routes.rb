Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  get '/home/about', to: "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books
  resources :users, only: [:index, :show, :edit, :update]

end
