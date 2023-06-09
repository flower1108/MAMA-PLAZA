Rails.application.routes.draw do


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

  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :users do

    resources :posts

    resources :users, only: [:show, :edit, :update]
  end

  namespace :admins do
    resources :posts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
