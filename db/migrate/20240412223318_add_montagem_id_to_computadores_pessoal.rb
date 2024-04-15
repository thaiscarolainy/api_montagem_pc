class AddMontagemIdToComputadoresPessoal < ActiveRecord::Migration[7.0]
  def change
    add_reference :computadores_pessoal, :montagem, null: false, foreign_key: true
  end
end
