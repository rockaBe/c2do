C2do::Application.routes.draw do
  
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users

  resources :lists, only: [:index]
  
 	namespace :my, path: "my" do
 		resources :lists, shallow: true do
 			resources :todos, shallow: true do
  			resources :tasks, shallow: true
  		end
  	end
  end

end