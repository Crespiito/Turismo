class CreateUsuarioGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_generals, id: false do |t|
      t.string :DNI, primary_key: true
      t.string :Nombre
      t.string :Direccion
      t.string :Telefono
      t.string :Ciudad
      t.string :Correo
      t.string :Genero
      t.string :Pais
      t.string :Edad

      t.timestamps
    end
  end
end
