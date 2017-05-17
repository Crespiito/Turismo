class CreateInteresesCatalogos < ActiveRecord::Migration[5.0]
  def change
    create_table :intereses_catalogos do |t|
      t.string :Nombre
      t.text :Descripcion

      t.timestamps
    end
  end
end
