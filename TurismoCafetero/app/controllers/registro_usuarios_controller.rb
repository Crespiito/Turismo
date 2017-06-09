class RegistroUsuariosController < ApplicationController
	before_action :intereses
	
	def intereses
		@InteresesBase = InteresesCatalogo.all
	end

	def generarpass
		minus = ("a".."z")
		mayus = ("A".."Z")
		num = (0..9)
		key = minus.to_a + mayus.to_a + num.to_a
    	pass = key.shuffle[0,8].join
    	return pass
  	end

  	def traducirintereses(interesescheck)
  		@lista_interes = interesescheck

  		j = 0
  		while j < @lista_interes.length
	  		if @lista_interes[j] == '1'
	  			@lista_interes[j-1] = '1'
	  			@lista_interes.delete_at(j)
	  		end
	  		j = j+1
  		end
  		
  		i = 0
  		@interes_usuario= ""
  		while i < @InteresesBase.length
  			if @lista_interes[i]== '1'
  				@interes_usuario = @InteresesBase[i].Nombre+"$"+@interes_usuario
  			end
  			i = i + 1
  		end
  		return @interes_usuario
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
		@Interesesadmin = params[:interesadmin]
		@Zonaadmin = params[:zonaadmin]
		@Interesessus= params[:registro][:interessus]

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
			flash[:notice] = "existe"
	      	redirect_to registro_usuarios_registro_path
		else 
			@UsuarioGeneral.save

			if @Rol == "Administrador"
				@IdAdmin = UsuarioAdmin.all.length
				@UsuarioAdmin = UsuarioAdmin.new({
					:IdAdmin => @IdAdmin,
					:DNI => @DNI,
					:Correo => @Correo,
					:Password => generarpass(),
					:Aprobado => 0,
					:Activo => 1,
					:Zona => @Zonaadmin,
					:Interes => @Interesesadmin
					})
				@UsuarioAdmin.save
				@Intereses = @Interesesadmin
			end

			if @Rol == "Suscrito"
				@IdSuscrito = UsuarioSuscrito.all.length
				@UsuarioSuscrito = UsuarioSuscrito.new({
					:IdSuscrito => @IdSuscrito,
					:DNI => @DNI,
					:Correo => @Correo,
					:Password => generarpass(),
					:Aprobado => 0,
					:Activo => 1
					})
				@UsuarioSuscrito.save

				@Tabla_Intereses = InteresUsuario.new({
					:DNI => @DNI,
					:Intereses => traducirintereses(@Interesessus)
				})
				@Tabla_Intereses.save
			end

			if @UsuarioGeneral.save and @UsuarioAdmin != nil
	      		flash[:notice] = "si"
	      		redirect_to registro_usuarios_registro_path
	      	else
	      		flash[:notice] = "no"
	      		redirect_to registro_usuarios_registro_path
	   		end
	   		if @UsuarioGeneral.save and @UsuarioSuscrito != nil
	      		flash[:notice] = "si"
	      		redirect_to registro_usuarios_registro_path
	      	else
	      		flash[:notice] = "no"
	      		redirect_to registro_usuarios_registro_path
	   		end
		end 
	end
end