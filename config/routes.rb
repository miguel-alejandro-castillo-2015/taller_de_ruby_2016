Rails.application.routes.draw do
  resources :lists,except: :index do
      resources :task_temps
      resources :task_longs
      resources :tasks 
  end
  root "lists#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
