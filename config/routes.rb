Rails.application.routes.draw do
  get '/', to: 'users#home', as: 'root'
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end