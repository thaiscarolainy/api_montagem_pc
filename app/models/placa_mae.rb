class PlacaMae < ApplicationRecord

    enum tipo_processador: { intel: 1, amd: 2, ambos: 3 }

    validates_presence_of :descricao, :tipo_processador, :quantidade_slot_memoria_ram, :total_memoria_ram
    validates_numericality_of :quantidade_slot_memoria_ram, :total_memoria_ram, only_integer: true
    validates_inclusion_of :quantidade_slot_memoria_ram, :in => 1..4, message: "O campo só permite valores de 1 (um) a 4 (quatro) slots disponiveis."
    validates_inclusion_of :total_memoria_ram, :in => [4, 8, 16, 32, 64], message: "O campo só permite valor máximo de 4, 8, 16, 32 ou 64 GB."
    validates_inclusion_of :video_integrado, :in => [true, false], message: "O campo só recebe valores verdadeiro ou false."

end
