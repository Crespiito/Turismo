class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :DNI
      t.string :Correo
      t.string :Password
      t.string :cargo

      t.timestamps
    end
  end
end
