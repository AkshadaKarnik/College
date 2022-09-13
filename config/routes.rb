Rails.application.routes.draw do
  devise_for :users 
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  #devise_scope :user do
  # get 'sign_in', to: 'devise/sessions#new'
  #end
  #devise_for :users, skip: :all
  root 'users#index'
  get '/stud_profile', to: 'users#index_stud'
  #get '/stud_show', to: 'users#show_stud'
  #get '/stud_edit', to: 'users#edit_stud'
  resources :users
  resources :colleges
  resources :departments
end


 