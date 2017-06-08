class CreateZonas < ActiveRecord::Migration[5.0]
  def change
    create_table :zonas do |t|
      t.string :Descripcion
      t.string :Longitud
      t.string :Latitud
      t.string :Superficie

      t.timestamps
    end
  end
end
