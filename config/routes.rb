Rails.application.routes.draw do
  # Maps to the index action in SearchController
  get 'search/index'
  # Maps to the about action in PagesController
  get 'pages/about'

  #Sets up authentication routes for admin_users 
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "events#index"
  resources :events
  resources :venues
  resources :classifications do
    member do
      get 'events'
    end
  end
  resources :artists
  get 'about', to: 'pages#about'
  get '/search', to: 'search#index', as: 'search'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
