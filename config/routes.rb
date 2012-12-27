Todoodly::Application.routes.draw do

  root to: 'lists#index'
  
  resources :lists do
  	resources :tasks
  end
  
  match 'lists/:list_id/tasks/:id/complete' => 'tasks#complete', as: :complete_task
  
  match 'lists/:list_id/tasks/:id/sort' => 'tasks#sort', as: :sort_task
  
  namespace :api do
  	resources :lists do
  		resources :tasks
  	end
  end
  
end