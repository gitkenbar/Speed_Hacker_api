Rails.application.routes.draw do
  get 'web/bootstrap', to: "web#bootstrap"
  scope '/' do
  end
  post '/login', to: 'sessions#create'
  resources :scores
  resources :contents
  resources :games
  resources :users do
    get 'usergames', to: "users#games_index"
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
