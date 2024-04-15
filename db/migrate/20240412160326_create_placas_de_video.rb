class CreatePlacasDeVideo < ActiveRecord::Migration[7.0]
  def change
    create_table :placas_de_video do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
