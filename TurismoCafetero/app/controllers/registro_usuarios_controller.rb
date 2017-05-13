class RegistroUsuariosController < ApplicationController

	def generarpass
		minus = ("a".."z")
		mayus = ("A".."Z")
		num = (0..9)
		key = minus.to_a + mayus.to_a + num.to_a
    	pass = key.shuffle[0,8].join
    	return pass
  	end

	def create
		@nombre = params[:registro][:nombre]
		@DNI = params[:registro][:DNI]
		@Direccion = params[:registro][:direccion]
		@Telefono = params[:registro][:telefono]
		@Ciudad = params[:registro][:ciudad]
		@Correo  = params[:registro][:email]
		@Genero = params[:genero]
		@Pais = params[:registro][:pais]
		@Edad = params[:registro][:edad]
		@Rol = params[:rol] 

		@UsuarioGeneral = UsuarioGeneral.new({
			:DNI => @DNI,
			:Nombre => @nombre,
			:Direccion => @Direccion,
			:Telefono => @Telefono,
			:Ciudad => @Telefono,
			:Correo => @Correo,
			:Genero => @Genero,
			:Pais => @Pais,
			:Edad => @Edad
			})
		
		if UsuarioGeneral.exists?(DNI:@DNI) or UsuarioGeneral.exists?(Correo: @Correo)
			render registro_usuarios_registro 
		else 
			@UsuarioGeneral.save
			if @Rol == "Administrador"
				@UsuarioAdmin = UsuarioAdmin.new({
					:IdAdmin => UsuarioAdmin.all.length,
					:DNI => @DNI,
					:Correo => @Correo,
					:Password => generarpass(),
					:Aprobado => 0,
					:Activo => 1
					})
				@UsuarioAdmin.save
			end

			if @Rol == "Suscrito"
				@UsuarioSuscrito = UsuarioSuscrito.new({
					:IdSuscrito => UsuarioSuscrito.all.length,
					:DNI => @DNI,
					:Correo => @Correo,
					:Password => generarpass(),
					:Aprobado => 0,
					:Activo => 1
					})
				@UsuarioSuscrito.save
			end

			if @UsuarioGeneral.save and @UsuarioAdmin != nil
	      		redirect_to home_index_path, :notice => "El registro ha sido eviado";
	   		end

	   		if @UsuarioGeneral.save and @UsuarioSuscrito != nil
	      		redirect_to home_index_path, :notice => "El registro ha sido eviado";
	   		end
		end 
	end
end


