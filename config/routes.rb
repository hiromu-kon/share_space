Rails.application.routes.draw do
  get 'call_center_users/show'
  get 'call_center_users/index'
  get 'host_users/show'
  get 'host_users/index'
  devise_for :call_center_users, controllers: {
    sessions:      'call_center_users/sessions',
    passwords:     'call_center_users/passwords',
    registrations: 'call_center_users/registrations'
  }
  devise_for :host_users, controllers: {
    sessions:      'host_users/sessions',
    passwords:     'host_users/passwords',
    registrations: 'host_users/registrations'
  }
  root 'static_pages#home'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  resources :call_center_users, only: :show
  resources :host_users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
