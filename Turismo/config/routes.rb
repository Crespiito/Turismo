Rails.application.routes.draw do

  devise_for :users
  #resources :'home'
  
  root 'home#index'
  
  post 'devise/home/index'

  get 'home/index'

  get 'home/new', to: 'home#new', as: 'Account'
  #post 'home/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
