Rails.application.routes.draw do
  resources :home, only: [:index]
  get 'login/ingreso'

  devise_for :users
  
  root 'home#index'
  
  post 'devise/home/index'

  get 'home/index'

  get 'home/new', to: 'home#new', as: 'Account'
  #post 'home/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
