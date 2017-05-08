class ElegirRolController < ApplicationController
  before_action :comprobar_sesion
  
	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email])
			puts "aqui x2 " , session[:email] 
			redirect_to ingreso_session_path
		end
	end

end
