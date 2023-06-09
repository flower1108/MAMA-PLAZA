Rails.application.routes.draw do

  root to: 'homes#top'
  get '/about' => 'homes#about'

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


  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :users do

    resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] do
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
        get :favorites, :followings, :followers, :unsubscribe
        patch :withdraw
      end
    end
  end

  namespace :admins do

    resources :posts, only: [:index, :show, :destroy]
      resources :comments, only: [:destroy]

    resources :users, only: [:show, :index, :update, :edit]

  end

  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
