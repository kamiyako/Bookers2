Rails.application.routes.draw do
  
  root to: "homes#top"
  devise_for :users
  get "homes/about", to: "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books
  resources :users, only: [:show, :edit, :update, :index
]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
