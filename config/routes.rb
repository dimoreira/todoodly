Todoodly::Application.routes.draw do

  root to: 'main#home'
  
  resources :lists do
  	resources :tasks
  end
  
  match 'home' => 'main#home', as: :home
  
  match 'lists/:list_id/tasks/:id/complete' => 'tasks#complete', as: :complete_task
  match 'lists/:list_id/tasks/:id/sort' => 'tasks#sort', as: :sort_task
  
  match 'signup' => 'users#new', as: :signup
  match 'users/create' => 'users#create', as: :users
  
  match 'login' => 'users#login', as: :login
  match 'validate' => 'users#log_in', as: :validate
  match 'logout' => 'users#log_out', as: :logout
  
  namespace :api do
  	resources :lists do
  		resources :tasks
  	end
  end
  
end