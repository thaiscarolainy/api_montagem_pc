class MemoriaRam < ApplicationRecord

    validates_presence_of :descricao, :tamanho
    validates_numericality_of :tamanho, only_integer: true
    validates_inclusion_of :tamanho, :in => [4, 8, 16, 32, 64], message: "O campo só permite valores de 4, 8, 16, 32 or 64 GB de memória."
  
end
