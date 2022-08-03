Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  get '/home/about', to: "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create,:destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
