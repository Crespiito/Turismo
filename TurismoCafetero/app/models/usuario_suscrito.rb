class UsuarioSuscrito < ApplicationRecord
	validates :IdSuscrito, :presence => true
	validates :DNI, :presence => true
	validates :Correo, :presence => true
	validates :Password, :presence => true
	validates :Aprobado, :presence => true
	validates :Activo, :presence => true
end
