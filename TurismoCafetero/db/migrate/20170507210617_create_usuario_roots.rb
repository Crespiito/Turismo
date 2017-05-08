class CreateUsuarioRoots < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_roots, id: false do |t|
      t.string :IdRoot, primary_key: true
      t.string :DNI
      t.string :Correo
      t.string :Password
      t.timestamps
    end
    add_foreign_key :usuario_roots, :usuario_generals , column: :DNI, primary_key: :DNI
  end
end
