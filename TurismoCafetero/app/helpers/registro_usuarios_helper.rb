module RegistroUsuariosHelper
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
