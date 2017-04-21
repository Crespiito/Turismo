class CreateInteres < ActiveRecord::Migration[5.0]
  def change
    create_table :interes do |t|
      t.integer :DNI
      t.string :Interes

      t.timestamps
    end
  end
end
