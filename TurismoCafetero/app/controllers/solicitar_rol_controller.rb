class SolicitarRolController < ApplicationController
  before_action :comprobar_sesion
  
	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email]) 
			redirect_to ingreso_session_path
		end
		@InteresesBase = InteresesCatalogo.all
	end

	def traducirintereses(interesescheck)
  		@lista_interes = interesescheck
  		i = 0
  		@interes_usuario= ""
  		while i < @InteresesBase.length
  			if @lista_interes[2*i+1]== '1'
  				@interes_usuario = @InteresesBase[i].Nombre+"$"+@interes_usuario
  			end
  			i = i + 1
  		end
  		return @interes_usuario
  	end

	def solicitar
		@Usuario_datosg = UsuarioGeneral.find_by(Correo: session[:email])
		@Zonaadmin = params[:zonaadmin]
		@Interesesadmin = params[:interesadmin]
		@Interesessus= params[:solicitud][:interessus]
		@Tipo= params[:solicitud][:tipo]
		puts "Interesessus",@Interesessus, "Esto es lo que imprime interesessuss"
		puts "Admin",@Interesesadmin

		if session[:sus]
			@Usuario_pass = UsuarioSuscrito.find_by(DNI: @Usuario_datosg.DNI).Password
		end
		if session[:root]
			@Usuario_pass = UsuarioRoot.find_by(DNI: @Usuario_datosg.DNI).Password
		end
		if session[:admin]
			@Usuario_pass = UsuarioAdmin.find_by(DNI: @Usuario_datosg.DNI).Password
		end

		if @Tipo == "Suscrito"
			puts "----------------------------suscrito----------------------------------"
			@IdSuscrito = UsuarioSuscrito.all.length
			@UsuarioSuscrito = UsuarioSuscrito.new({
				:IdSuscrito => @IdSuscrito,
				:DNI => @Usuario_datosg.DNI,
				:Correo => @Usuario_datosg.Correo,
				:Password => @Usuario_pass,
				:Aprobado => 0,
				:Activo => 1
				})
			@UsuarioSuscrito.save

			@Tabla_Intereses = InteresUsuario.new({
				:DNI => @Usuario_datosg.DNI,
				:Intereses => traducirintereses(@Interesessus)
			})
			@Tabla_Intereses.save
			redirect_to elegir_rol_elegir_path
		else
			puts "-----------------admin---------------------------------------------------"
			@IdAdmin = UsuarioAdmin.all.length
			@UsuarioAdmin = UsuarioAdmin.new({
				:IdAdmin => @IdAdmin,
				:DNI => @Usuario_datosg.DNI,
				:Correo => @Usuario_datosg.Correo,
				:Password => @Usuario_pass,
				:Aprobado => 0,
				:Activo => 1,
				:Zona => @Zonaadmin,
				:Interes => @Interesesadmin
				})
			@UsuarioAdmin.save
			redirect_to elegir_rol_elegir_path
		end
	end
end
