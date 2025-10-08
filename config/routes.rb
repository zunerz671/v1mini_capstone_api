Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/teams" => "teams#index"
  post "/teams" => "teams#create"
  get "/teams/:id" => "teams#show"
  put "/teams/:id" => "teams#update"
  delete "/teams/:id" => "teams#destroy"

  get "/games" => "games#index"
  post "/games" => "games#create"
  get "/games/:id" => "games#show"
  put "/games/:id" => "games#update"
  delete "/games/:id" => "games#destroy"
end
