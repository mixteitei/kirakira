Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  resources :points, only: [:create, :update, :destroy]
  
  resources :diaries, except: [:show] do
    resource :favorites, only:[:create, :destroy]
  end
  
  get 'users/unsubscribe' => 'users#unsubscribe'
  patch 'users/withdraw' => 'users#withdraw'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  
  get 'search' => 'searches#search'
end
