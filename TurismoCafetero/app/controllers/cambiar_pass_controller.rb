class CambiarPassController < ApplicationController
	  before_action :comprobar_sesion
  
	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email]) 
			redirect_to ingreso_session_path
		end
	end

  	def cambio_pass
  		@Usuario_datosg = UsuarioGeneral.find_by(Correo: session[:email])
  		@Usuario_pass_nuevo= params[:contra][:password]
  		@Usuario_pass_nuevo_confirm= params[:contra][:password_confirm]
  		@Usuario_pass_sus=""
  		@Usuario_pass_root=""
  		@Usuario_pass_admin=""

  		if @Usuario_pass_nuevo == @Usuario_pass_nuevo_confirm

  			if session[:sus]
				@Usuario_pass_sus = UsuarioSuscrito.find_by(DNI: @Usuario_datosg.DNI)
			end
			if session[:root]
				@Usuario_pass_root = UsuarioRoot.find_by(DNI: @Usuario_datosg.DNI)
			end
			if session[:admin]
				@Usuario_pass_admin = UsuarioAdmin.find_by(DNI: @Usuario_datosg.DNI)
			end

			if @Usuario_pass_sus != ""
				@Usuario_pass_sus.Password = @Usuario_pass_nuevo
				@Usuario_pass_sus.save()
			end

			if @Usuario_pass_root != ""
				@Usuario_pass_root.Password = @Usuario_pass_nuevo
				@Usuario_pass_root.save()
			end

			if @Usuario_pass_admin != ""
				@Usuario_pass_admin.Password = @Usuario_pass_nuevo
				@Usuario_pass_admin.save()
			end

			flash[:notice] = "si"
  		else
  			flash[:notice] = "no"
  		end

  		redirect_to cambiar_pass_cambio_path
  	end
end
