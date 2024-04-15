class Processador < ApplicationRecord

    enum marca: { intel: 1, amd: 2 }

    validates_presence_of :descricao, :marca

end
