Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  resources :users, only: :show do
    resources :bookmarks, only: [:index]
  end
  resources :posts do
    resources :bookmarks, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    collection do
      get 'skill'
    end
  end
  resources :rooms, only: [:index, :create, :show]
  resources :messages, only: [:create, :destroy]
  resources :notifications, only: :index do
    collection do
      delete 'destroy_all'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
