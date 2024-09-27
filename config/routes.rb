Rails.application.routes.draw do
  resources :pets
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  get 'show/show'
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        patch :approve
      end
    end
  end

  # Pets Route Config
  resources :pets do
    post 'report_missing', on: :member
  end

  devise_for :users

  resources :posts
  root 'pages#home'

  # Config/routes.rb
  get 'show/:id', to: 'show#show', as: 'show_post'
  post 'notify_user/:id', to: 'show#notify_user', as: 'notify_user'

  # Updated route for profile
  get 'profile', to: 'profiles#show'
  get 'about', to: 'pages#about'

  resource :profile, only: [:show, :edit, :update]

  # Google User Sign Up 
  
  # get 'about', to 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
