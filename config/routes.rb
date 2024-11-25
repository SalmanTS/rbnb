Rails.application.routes.draw do
  devise_for :users
  root to: "scooters#index"
  get '/scooters/my_scooters', to: 'scooters#my_scooters'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :scooters do
    resources :bookings, only: :create
  end
  resources :bookings, only: :destroy
  # Defines the root path route ("/")
  # root "posts#index"

end


# config/routes.rb
# resources :scooters, only: [:new, :create]
