Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about", to: "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
