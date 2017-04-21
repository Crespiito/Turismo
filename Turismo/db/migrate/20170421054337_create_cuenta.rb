class CreateCuenta < ActiveRecord::Migration[5.0]
  def change
    create_table :cuenta do |t|
      t.string :Correo
      t.string :Password
      t.string :Cargo

      t.timestamps
    end
  end
end
