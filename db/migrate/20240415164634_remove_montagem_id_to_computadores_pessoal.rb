class RemoveMontagemIdToComputadoresPessoal < ActiveRecord::Migration[7.0]
  def change
    remove_column :computadores_pessoal, :montagem_id, :bigint
  end
end
