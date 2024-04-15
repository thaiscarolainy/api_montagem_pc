class CreateComputadoresPessoal < ActiveRecord::Migration[7.0]
  def change
    create_table :computadores_pessoal do |t|
      t.references :processador, null: false, foreign_key: true
      t.references :placa_mae, null: false, foreign_key: true
      t.references :placa_de_video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
