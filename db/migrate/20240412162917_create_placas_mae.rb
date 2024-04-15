class CreatePlacasMae < ActiveRecord::Migration[7.0]
  def change
    create_table :placas_mae do |t|
      t.string :descricao
      t.integer :tipo_processador
      t.integer :quantidade_slot_memoria_ram
      t.integer :total_memoria_ram
      t.boolean :video_integrado

      t.timestamps
    end
  end
end
