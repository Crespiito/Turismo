class IngresoController < ApplicationController
	def create
		@email = params[:session][:email]
		@password = params[:session][:password]
		session[:admin] = false
		session[:user] = false

		@userRoot = UsuarioRoot.find_by(Correo: @email, Password: @password) 
		if @userRoot
			session[:root] = true
		else
			session[:root] = false
		end

		@userAdmin = UsuarioAdmin.find_by(Correo: @email, Password: @password) 
		if @userAdmin
			session[:admin] = true
		else
			session[:admin] = false 
		end

		@userSus = UsuarioSuscrito.find_by(Correo: @email, Password: @password) 
		if @userSus
			session[:sus] = true
		else
			session[:sus] = false
		end

		if session[:sus] or session[:admin] or session[:root]
			puts "aqui" , @email
			session[:email] = @email 
			redirect_to elegir_rol_elegir_path
		else
			puts "aqui"
			session[:email] = nil
			redirect_to ingreso_session_path
		end
	end
end
