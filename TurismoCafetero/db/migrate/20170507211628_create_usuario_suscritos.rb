class CreateUsuarioSuscritos < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_suscritos, id: false do |t|
      t.string :IdSuscrito, primary_key: true
      t.string :DNI
      t.string :Correo
      t.string :Password
      t.integer :Aprobado
      t.integer :Activo

      t.timestamps
    end
    add_foreign_key :usuario_suscritos, :usuario_generals , column: :DNI, primary_key: :DNI
  end
end
