class SeleccionRolController < ApplicationController
	def usuario
		@_current_user= session[:current_user_id]
	end
end
