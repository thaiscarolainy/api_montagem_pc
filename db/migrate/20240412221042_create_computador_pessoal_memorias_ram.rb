class CreateComputadorPessoalMemoriasRam < ActiveRecord::Migration[7.0]
  def change
    create_table :computador_pessoal_memorias_ram do |t|
      t.references :computador_pessoal, null: false, foreign_key: true
      t.references :memoria_ram, null: false, foreign_key: true

      t.timestamps
    end
  end
end
