Rails.application.routes.draw do
  devise_for :users 
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  #devise_scope :user do
  # get 'sign_in', to: 'devise/sessions#new'
  #end
  #devise_for :users, skip: :all
  get 'homes/about'
  root 'homes#index'
  resources :colleges
  resources :departments
end


 