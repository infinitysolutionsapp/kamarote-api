Rails.application.routes.draw do
  resources :accounts
  resources :configs
  resources :partners
  
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/auth/me', to: 'users#me'

  # get '/*a', to: 'application#not_found'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
