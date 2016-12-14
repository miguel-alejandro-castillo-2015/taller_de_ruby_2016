Rails.application.routes.draw do
 
  resources :lists do
      resources :tasks do
      	 collection do
      	 	get "new_list_simple"
      	 	get "new_list_temp"  
      	 	get "new_list_long" 
          
      	 end
       end
  end
  root "lists#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
