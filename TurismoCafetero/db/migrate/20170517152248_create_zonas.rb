class CreateZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :zonas do |t|
      t.string :Descripcion
      t.float :Longitud
      t.float :Latitud

      t.timestamps
    end
  end
end
