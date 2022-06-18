Rails.application.routes.draw do
  resources :styles
  resources :pictures do
    resource :like, only: %i[create destroy]
  end
  resources :museums do
    resource :follow, only: %i[create destroy]
  end

  get 'users/index'
  resources :users, param: :code, path: '/', only: [:show, :edit, :update, :destroy]
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
  root to: "users#timeline"
end
