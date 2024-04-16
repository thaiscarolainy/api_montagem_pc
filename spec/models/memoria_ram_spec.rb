require 'rails_helper'

RSpec.describe MemoriaRam, type: :model do
  describe 'validacoes' do
    it { is_expected.to validate_presence_of(:descricao) }
    it { is_expected.to validate_presence_of(:tamanho)}
    it { is_expected.to validate_numericality_of(:tamanho).only_integer }

    it 'só aceita valores de 4, 8, 16, 32, 64 do total de memoria' do
      [4, 8, 16, 32, 64].each do |v|
        should allow_value(v).for(:tamanho)
      end

      should_not allow_value(6).for(:tamanho)
      should_not allow_value(13).for(:tamanho)
      should_not allow_value(16.5).for(:tamanho)
    end
  end
end
