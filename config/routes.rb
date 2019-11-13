Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts, param: :_cpf
  post '/auth/login', to: 'authentication#login'
  post '/operations/transfer', to: 'operations#transfer' 

end
