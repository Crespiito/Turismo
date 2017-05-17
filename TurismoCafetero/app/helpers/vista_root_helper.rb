module VistaRootHelper

	def misintereses(dni)
		@DNI = dni
		@intereses = InteresUsuario.find_by(DNI: @DNI)
		if @intereses != nil
			@interes_split = @intereses.Intereses.split("$")
		end
		return @interes_split
	end
end
