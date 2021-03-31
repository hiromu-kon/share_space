Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
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
      get 'search'
    end
  end
  resources :rooms, only: [:index, :create, :show]
  resources :messages, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
