class VistaSuscritoController < ApplicationController
	before_action :comprobar_sesion

	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end

		unless UsuarioSuscrito.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end
		@suscrito = UsuarioSuscrito.find_by(Correo: session[:email])
		@interes = InteresUsuario.find_by(DNI: @suscrito.DNI)
		@marc = Marcador.all
		if @interes != nil
			@interes_split = @interes.Intereses.split("$")
			l = 0
			j = 0
			@marcs = []
			while (j < @interes_split.length)
				while l < @marc.length
					if @marc[l].Idinteres.include?(@interes_split[j])
						puts @marc[l].Nombre
						@marcs.append(@marc[l])
					end
					l = l+1
				end
				j = j+1
			end
		end
		@i = 0
		@a = 0
	end
end
