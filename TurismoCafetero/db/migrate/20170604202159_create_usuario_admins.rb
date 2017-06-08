class CreateUsuarioAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_admins, id: false do |t|
      t.string :IdAdmin, primary_key: true
      t.string :DNI
      t.string :Correo
      t.string :Password
      t.integer :Aprobado
      t.integer :Activo
      t.string :Zona
      t.string :Interes
      t.timestamps
    end
  add_foreign_key :usuario_admins, :usuario_generals , column: :DNI, primary_key: :DNI
  end
end
