class UsuarioAdmin < ApplicationRecord
	validates :IdAdmin, :presence => true
	validates :DNI, :presence => true
	validates :Correo, :presence => true
	validates :Password, :presence => true
	validates :Aprobado, :presence => true
	validates :Activo, :presence => true
	validates :Zona, :presence => true
	validates :Interes, :presence => true
end
