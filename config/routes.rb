Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts, param: :id
  get '/account/cpf/:cpf', to: 'accounts#show_by_cpf'
  post '/auth/login', to: 'authentication#login'
  post '/operations', to: 'operations#create' 
  get '/operations', to: 'operations#index' 
  post '/operations/jwt', to: 'operations#create_with_jwt'

end
