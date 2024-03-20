Rails.application.routes.draw do
  get 'web/bootstrap'
  scope '/' do
  end
  post '/login', to: 'sessions#create'
  resources :contents do
    get 'contents', to: "content#content_index"
  end
  resources :games
  resources :users do
    get 'users', to: "user#posts_index"
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
