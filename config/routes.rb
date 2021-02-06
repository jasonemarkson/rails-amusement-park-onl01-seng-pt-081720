Rails.application.routes.draw do
  get '/', to: 'users#home', as: 'root'
  get 'users/new', to: 'users#new'
  get 'users/show', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
