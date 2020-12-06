Rails.application.routes.draw do
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :messages, only: [:create]
  resources :users,only: [:show,:index,:edit,:update] do
     resources :rooms, only: [:create]
     
  end
  resources :rooms, only: [:show] do
    resources :chats, only: [:create]
  end
  resources :books

end