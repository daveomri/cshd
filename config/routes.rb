Rails.application.routes.draw do
  resources :roles
  resources :songs
  resources :interactions
  resources :reviews
  resources :artists
  resources :languages
  resources :states
  get 'static_pages/home'
  resources :users

  root 'static_pages#home'
  post 'sign_up', to: 'users#create'
  get 'sign_up', to: 'users#new'

  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'

  put 'account', to: 'users#update'
  get 'account', to: 'users#edit'
  delete 'account', to: 'users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'
end
