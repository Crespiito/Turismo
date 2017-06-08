module VistaAdminHelper
	def filtro_interes(correous, correoadmin)
		@Correous = correous
		@Correoad= correoadmin
		@UsuarioSus= UsuarioGeneral.find_by(Correo: @Correous)
		@UsuarioAdmin = UsuarioAdmin.find_by(Correo: @Correoad)
		@interes_admin = @UsuarioAdmin.Interes
		@intereses = InteresUsuario.find_by(DNI: @UsuarioSus.DNI)
		if @intereses != nil
			@interes_split = @intereses.Intereses.split("$")
		end

		@interes_split.each do |interes|
			if @interes_admin == interes
				return true
			end
		end
		return false
	end

	def catalogointereses
		@intereses = InteresesCatalogo.all
		@lista_interes =[]
		@intereses.each do |i|
			@lista_interes = @lista_interes.append(i.Nombre)
		end
		return @lista_interes
	end
	
	def zona
		@zona = Zona.all
		@lista_zonas =[]
		@zona.each do |i|
			@lista_zonas = @lista_zonas.append(i.Descripcion)
		end
		return @lista_zonas
	end
end
