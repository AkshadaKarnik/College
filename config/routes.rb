Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :colleges
  resources :departments
  resources :students
  root "homes#index"
  get 'homes/about'
  #get "/colleges", to: "colleges#show"
  
end
