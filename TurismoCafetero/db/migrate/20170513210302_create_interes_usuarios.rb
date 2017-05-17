class CreateInteresUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :interes_usuarios do |t|
      t.string :DNI
      t.string :Intereses

      t.timestamps
    end
    add_foreign_key :interes_usuarios, :usuario_generals , column: :DNI, primary_key: :DNI
  end
end
