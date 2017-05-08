class VistaRootController < ApplicationController
	before_action :comprobar_sesion

	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end
	end
end
