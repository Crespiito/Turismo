class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.integer :DNI
      t.string :Nombre
      t.string :Direccion
      t.string :Ciudad
      t.string :Pais
      t.integer :Telefono
      t.string :Correo
      t.string :Genero
      t.integer :Edad

      t.timestamps
    end
  end
end
