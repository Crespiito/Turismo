class VistaRootController < ApplicationController
	before_action :comprobar_sesion

	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end
		unless UsuarioRoot.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end
		@datos = UsuarioAdmin.all
	end

	def aprobar
		@correo = params[:usuario][:correo]
		@UsuarioAdmin = UsuarioAdmin.find_by(Correo: @correo)
		if @UsuarioAdmin.Aprobado == 0
			@UsuarioAdmin.Aprobado = 1
		else
			@UsuarioAdmin.Aprobado = 0
		end
			@UsuarioAdmin.save
		render vista_root_root_path
	end

	def eliminar
		@correo = params[:usuario][:correo]
		@UsuarioAdmin = UsuarioAdmin.find_by(Correo: @correo)

		if @UsuarioAdmin.Activo == 0
			@UsuarioAdmin.Activo = 1
		else
			@UsuarioAdmin.Activo = 0
		end
			@UsuarioAdmin.save
		render vista_root_root_path
	end

	def mostrar
		@correo = params[:usuario][:correo]
		@Usuario = UsuarioGeneral.find_by(Correo: @correo)
		@Estado = UsuarioAdmin.find_by(Correo: @correo).Aprobado
		@Eliminado = UsuarioAdmin.find_by(Correo: @correo).Activo
		render vista_root_root_path
	end

	def volver
		redirect_to vista_root_root_path
	end

end
