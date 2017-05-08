class UsuarioGeneral < ApplicationRecord
	validates :DNI, :presence => true
	validates :Nombre, :presence => true
	validates :Direccion, :presence => true
	validates :Telefono, :presence => true
	validates :Ciudad, :presence => true
	validates :Correo, :presence => true
	validates :Genero, :presence => true
	validates :Pais, :presence => true
	validates :Edad, :presence => true
end
