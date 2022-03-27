Rails.application.routes.draw do
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    devise_for :users, controllers: { registrations: 'users/registrations' }
  end
  root to: 'homes#index'
  post '/', to: 'homes#index'
  resources :trainings
  resources :articles do
    resources :comments, only: [:create, :destroy]

    resource :like, only: [:create, :destroy]
    get '/like', to: 'likes#create', format: "html"
  end
  resources :users, only: [:show] do
    member do
      get :followings, :followers
    end
  end
  resources :likes, only: [:index]
  resources :accounts, only: [:show]
  resources :relationships, only: [:create, :destroy]
end
