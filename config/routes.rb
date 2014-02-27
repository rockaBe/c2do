C2do::Application.routes.draw do
  
  resources :sharings

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users

  resources :lists, only: [:index]
  
 	namespace :my, path: "my" do
 		resources :lists, shallow: true do
 			collection do
        post :sort
      end
      resources :todos, shallow: true do
        member do
          put :update_state
        end
  			resources :tasks, shallow: true
  		end
  	end
  end

end