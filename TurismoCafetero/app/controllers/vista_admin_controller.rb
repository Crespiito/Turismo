class VistaAdminController < ApplicationController
	before_action :comprobar_sesion

	def comprobar_sesion
		unless UsuarioGeneral.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end
		unless UsuarioAdmin.find_by(Correo: session[:email])
			redirect_to ingreso_session_path
		end
		@datos = UsuarioSuscrito.all
	end

	def mostrar
		redirect_to home_index_path
	end

	def aprobar
		@correo = params[:usuario][:correo]
		@UsuarioSus = UsuarioSuscrito.find_by(Correo: @correo)
		if @UsuarioSus.Aprobado == 0
			@UsuarioSus.Aprobado = 1
		else
			@UsuarioSus.Aprobado = 0
		end
			@UsuarioSus.save
		render vista_admin_admin_path
	end

	def eliminar
		@correo = params[:usuario][:correo]
		@UsuarioSus = UsuarioSuscrito.find_by(Correo: @correo)

		if @UsuarioSus.Activo == 0
			@UsuarioSus.Activo = 1
		else
			@UsuarioSus.Activo = 0
		end
			@UsuarioSus.save
		render vista_admin_admin_path
	end

	def volver
		redirect_to vista_root_root_path
	end
end
