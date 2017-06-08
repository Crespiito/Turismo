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
		@admin = UsuarioAdmin.find_by(Correo: session[:email])
		@zona = Zona.find_by(Descripcion: @admin.Zona)
		@marc = Marcador.where(Idadmin: @admin.IdAdmin)
		@i = 0
	end

	def mostrar
		redirect_to home_index_path
	end

	def agregar_contenido 
		@nombre = params[:marcador][:nombre]
		@texto = params[:marcador][:texto]
		@imagen = params[:marcador][:imagen]
		@video = params[:marcador][:video]
		@longitud = params[:marcador][:longitud]
		@latitud = params[:marcador][:latitud]
		@width = 420
		@height = 315

		@video_html = @video.split('watch?v=')
		if @video_html.length == 2
			@video_html_embed = "#{@video_html[0]}embed/#{@video_html[1]}"
		else
			@video_html_embed = "http://img.rtve.es/css/i/blank.gif"
			@width = 1
			@height = 1
		end

		@Marcador = Marcador.new({
			:Nombre => @nombre,
			:Texto => @texto,
			:Imagen => @imagen,
			:Video => @video_html_embed,
			:Longitud => @longitud,
			:Latitud => @latitud,
			:Idadmin => @admin.IdAdmin,
			:Idinteres => @admin.Interes
			})
		@Marcador.save
		redirect_to vista_admin_admin_path
	end

	def modificar_contenido
		@nombre = params[:modificar][:nom]
		@texto = params[:modificar][:tex]
		@imagen = params[:modificar][:img]
		@video = params[:modificar][:vid]
		@id = params[:modificar][:id]
		@id = Integer(@id)
		@width = 420
		@height = 315

		@video_html = @video.split('watch?v=')
		if @video_html.length == 2
			@video_html_embed = "#{@video_html[0]}embed/#{@video_html[1]}"
		else
			@video_html_embed = "http://img.rtve.es/css/i/blank.gif"
			@width = "1"
			@height = "1"
		end

		@ActualizarMarc = Marcador.find_by(id: @marc[@id].id)
		if @nombre != ""
			@ActualizarMarc.Nombre = @nombre		
		end
		if @texto != ""
			@ActualizarMarc.Texto = @texto
		end
		if @imagen != ""
			@ActualizarMarc.Imagen = @imagen
		end
		if @video != ""
			@ActualizarMarc.Video = @video_html_embed
		end
		@ActualizarMarc.save()
		redirect_to vista_admin_admin_path
	end

	def eliminar_marcador
		@id = params[:eliminar][:id]
		@id = Integer(@id)
		@MarcD = Marcador.find_by(id: @marc[@id].id)
		@MarcD.destroy
		redirect_to vista_admin_admin_path
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
