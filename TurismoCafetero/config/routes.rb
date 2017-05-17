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

  post "home" => "home#salir"

  post "ingreso" => "ingreso#create"

  post "registro_usuarios" => "registro_usuarios#create"

  post "vista_root" => "vista_root#mostrar"

  get "vista_root" => "vista_root#volver"

  post "vista_root_aceptar" => "vista_root#aprobar"

  get "vista_root_aceptar" => "vista_root#volver"

  post "vista_root_eliminar" => "vista_root#eliminar"

  get "vista_root_eliminar" => "vista_root#volver"

  post "vista_root_modificar" => "vista_root#modificar"

  get "vista_root_modificar" => "vista_root#volver"

  post "vista_admin" => "vista_admin#mostrar"

  get "vista_admin" => "vista_admin#volver"

  post "vista_admin_aceptar" => "vista_admin#aprobar"

  get "vista_admin_aceptar" => "vista_admin#volver"

  post "vista_admin_eliminar" => "vista_admin#eliminar"

  get "vista_admin_eliminar" => "vista_admin#volver"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  
end
