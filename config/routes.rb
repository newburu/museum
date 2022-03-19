Rails.application.routes.draw do
  get 'museums/index'
  get 'museums/show'
  get 'museums/edit'
  get 'museums/new'
  get 'museum/index'
  get 'museum/show'
  get 'museum/edit'
  get 'museum/new'
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"
end
