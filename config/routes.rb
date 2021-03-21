Rails.application.routes.draw do
  get 'messages/create'
  get 'messages/edit'
  get 'messages/update'
  get 'messages/destroy'
  get 'rooms/index'
  get 'rooms/create'
  get 'rooms/show'
  devise_for :call_center_users, controllers: {
    sessions: 'call_center_users/sessions',
    registrations: 'call_center_users/registrations',
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  resources :call_center_users, only: :show
  resources :users, only: :show
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:index, :create, :show]
  resources :messages, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
