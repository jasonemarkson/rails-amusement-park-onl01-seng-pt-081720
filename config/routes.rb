Rails.application.routes.draw do
  get '/', to: 'users#home', as: 'root'
  resources :users
  get '/signin', to: 'users#signin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
