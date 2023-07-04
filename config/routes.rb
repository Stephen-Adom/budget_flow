Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect("/welcome")
  get "welcome", to: "welcome#index"
  devise_for :users, path: "auth"
  get "home", to: "home#index", as: :home
end
