class HomeController < ApplicationController
	def salir
    	session.delete(:email)
        session.delete(:admin)
        session.delete(:sus)
        session.delete(:root)
        render home_index_path
	end
end
