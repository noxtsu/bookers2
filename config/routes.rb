Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
  #get 'users/new'
  #get 'users/edit'
  #get 'books/index'
  #get 'books/show'
  #get 'books/new'
  #get 'books/edit'
  devise_for :users
  root :to => 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books
  resources :users

end
