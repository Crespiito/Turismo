class CreateMarcadors < ActiveRecord::Migration[5.0]
  def change
    create_table :marcadors do |t|
      t.string :Nombre
      t.string :Texto
      t.string :Imagen
      t.string :Video
      t.string :Longitud
      t.string :Latitud
      t.string :Idadmin
      t.string :Idinteres

      t.timestamps
    end
  end
end
