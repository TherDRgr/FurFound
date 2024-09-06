Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        patch :approve
      end
    end
  end
  devise_for :users
  resources :posts
  root 'pages#home'

  # get 'about', to 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
