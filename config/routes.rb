Rails.application.routes.draw do


  namespace :users do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  get 'relationships/followings'
  get 'relationships/followers'
  namespace :admins do
    get 'categories/index'
  end
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admins/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
  }

  root to: 'homes#top'
  get '/about' => 'homes#about'

  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :users do

    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
        get :living
        get :trip
        get :food
        get :talk
      end
    end

    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      member do
        get :favorites, :followings, :followers
      end
    end
  end

  namespace :admins do

    resources :posts, only: [:index, :show, :destroy]

    resources :users, only: [:show, :index]

  end

  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
