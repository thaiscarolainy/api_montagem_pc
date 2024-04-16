class ComputadorPessoal < ApplicationRecord
  belongs_to :processador, required: true
  belongs_to :placa_mae, required: true
  belongs_to :placa_de_video

  has_many :computador_pessoal_memorias_ram, dependent: :destroy
  has_many :memorias_ram, through: :computador_pessoal_memorias_ram

  accepts_nested_attributes_for :computador_pessoal_memorias_ram

  validates_presence_of :placa_de_video_id, unless: Proc.new { self.try(:placa_mae).try(:video_integrado?)}, message: 'O Computador Pessoal precisa ter placa de video integrado. Por favor, selecione uma opção.'

  validate :placa_mae_compativel_com_processador?
  validate :total_memoria_superior_ao_permitido?
  validate :quantidade_slot_superior_ao_permitido?
  validate :memoria_ram_selecionada?

  def placa_mae_compativel_com_processador?
    if placa_mae.try(:tipo_processador) != 3
      errors.add(:error, "Placa Mãe não suporta processador informado.") if placa_mae.try(:tipo_processador) != processador.try(:marca)
    end
  end

  def total_memoria_superior_ao_permitido?
    errors.add(:error, "Placa Mãe só suporta #{placa_mae.total_memoria_ram}GB de memória RAM.") if !computador_pessoal_memorias_ram.map(&:memoria_ram).join(", ").empty? && (computador_pessoal_memorias_ram.map(&:memoria_ram).sum(&:tamanho).to_i > placa_mae.total_memoria_ram)
  end

  def quantidade_slot_superior_ao_permitido?
    errors.add(:error, "Placa Mãe só comporta #{placa_mae.quantidade_slot_memoria_ram} slot de memória RAM até #{placa_mae.total_memoria_ram}GB.") if !computador_pessoal_memorias_ram.map(&:memoria_ram).join(", ").empty? && computador_pessoal_memorias_ram.map(&:memoria_ram).sum(&:tamanho).to_i > (placa_mae.quantidade_slot_memoria_ram * placa_mae.total_memoria_ram) 
  end

  def memoria_ram_selecionada?
    errors.add(:error, "Placa Mãe não localizada.") if computador_pessoal_memorias_ram.map(&:memoria_ram).join(", ").empty? || computador_pessoal_memorias_ram.reject { |memoria| memoria.marked_for_destruction? }.empty?
  end
end
