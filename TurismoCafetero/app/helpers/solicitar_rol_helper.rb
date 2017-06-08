module SolicitarRolHelper

	def admin?
		if UsuarioAdmin.find_by(Correo: session[:email])
			return true
		else
			return false 
		end
	end

	def suscrito?
		if UsuarioSuscrito.find_by(Correo: session[:email])
			return true
		else
			return false
		end
	end

end
