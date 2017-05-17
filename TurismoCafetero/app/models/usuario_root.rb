class UsuarioRoot < ApplicationRecord
	validates :IdRoot, :presence => true
	validates :DNI, :presence => true
	validates :Correo, :presence => true
	validates :Password, :presence => true
end
