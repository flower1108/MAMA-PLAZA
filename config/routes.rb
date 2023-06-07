Rails.application.routes.draw do

  namespace :admins do
    get 'users/show'
    get 'users/index'
  end
  namespace :users do
    get 'users/show'
    get 'users/edit'
  end
  namespace :users do
    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admins/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions'
  }

  root to: 'homes#top'

  #scope module: :public do
    #root to: 'homes#top'
  #end

  namespace :admin do
    resources :posts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
