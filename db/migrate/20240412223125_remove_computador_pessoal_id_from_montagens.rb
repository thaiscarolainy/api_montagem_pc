class RemoveComputadorPessoalIdFromMontagens < ActiveRecord::Migration[7.0]
  def change
    remove_reference :montagens, :computador_pessoal, null: false, foreign_key: true
  end
end
