class CreateUsuarioAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_admins do |t|
      t.string :IdAdmin
      t.string :DNI
      t.string :Correo
      t.string :Password
      t.integer :Aprobado
      t.integer :Activo
      t.string :Zona
      t.string :Interes

      t.timestamps
    end
  end
end
