class CreateMemoriasRam < ActiveRecord::Migration[7.0]
  def change
    create_table :memorias_ram do |t|
      t.string :descricao
      t.integer :tamanho

      t.timestamps
    end
  end
end
