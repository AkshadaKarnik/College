# frozen_string_literal: true
Rails.application.routes.draw do

  devise_for :users
  root 'users#index'
  get '/stud_profile', to: 'users#stud_profile'
  get '/show_stud', to: 'users#show_stud'
  get '/edit_stud', to: 'users#edit_stud'
  put '/update_stud', to: 'users#update_stud'
  resources :users
  resources :colleges
  resources :departments

  namespace :api do
    namespace :v1 do
      resources :users #, only: [:create]
      post '/auth/login', to: 'authentication#login'
    end
  end
end