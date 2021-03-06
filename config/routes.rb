Rails.application.routes.draw do
  resources :articles
  root to: 'articles#index'
  resources :users
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
resources :sessions, only: [:new, :create, :destroy] 
	get 'signup'  => 'users#new' 
	get '/login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'
 

  get 'home/index'
 
end
