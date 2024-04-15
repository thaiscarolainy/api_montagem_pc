class CreateProcessadores < ActiveRecord::Migration[7.0]
  def change
    create_table :processadores do |t|
      t.string :descricao
      t.integer :marca

      t.timestamps
    end
  end
end
