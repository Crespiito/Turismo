module VistaRootHelper

	def miinteres(dni)
		@DNI = dni
		@intereses = UsuarioAdmin.find_by(DNI: @DNI)
		return @intereses.Interes
	end

	def mizona(dni)
		@DNI = dni
		@zona = UsuarioAdmin.find_by(DNI: @DNI)
		return @intereses.Zona
	end
end
