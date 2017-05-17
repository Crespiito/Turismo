module RegistroUsuariosHelper
	def catalogointereses
		@intereses = InteresesCatalogo.all
		@lista_interes =[]
		@intereses.each do |i|
			@lista_interes = @lista_interes.append(i.Nombre)
		end
		return @lista_interes
	end
end
