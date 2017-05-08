Rails.application.routes.draw do

  get 'vista_admin/admin'

  get 'vista_root/root'

  get 'elegir_rol/elegir'

  get 'registro_usuarios/registro'

  post 'registro_usuarios/registro'

  post 'vista_root/root'

  post 'vista_admin/admin'

  post 'vista_suscrito/suscrito'

  post 'elegir_rol/elegir'  

  post 'ingreso/session'

  get 'ingreso/session'

  post 'home/index'

  get 'home/index'

  post "ingreso" => "ingreso#create"

  post "registro_usuarios" => "registro_usuarios#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  
end
