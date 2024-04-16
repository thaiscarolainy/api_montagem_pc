require 'rails_helper'

RSpec.describe PlacaMae, type: :model do

  describe 'validacoes' do
    it { is_expected.to validate_presence_of(:descricao) }
    it { is_expected.to validate_presence_of(:tipo_processador) }
    it { is_expected.to validate_presence_of(:quantidade_slot_memoria_ram) }
    it { is_expected.to validate_presence_of(:total_memoria_ram) }
    it { is_expected.to validate_numericality_of(:quantidade_slot_memoria_ram).only_integer }
    it { is_expected.to validate_numericality_of(:total_memoria_ram).only_integer }

    it 'só aceita valores entre 1 to 4 na quantidade de slot' do
      [1, 2, 3, 4].each do |v|
        should allow_value(v).for(:quantidade_slot_memoria_ram)
      end

      should_not allow_value(5).for(:quantidade_slot_memoria_ram)
      should_not allow_value(0).for(:quantidade_slot_memoria_ram)
    end

    it 'só aceita valores de 4, 8, 16, 32, 64 no total de memoria ram' do
      [4, 8, 16, 32, 64].each do |v|
        should allow_value(v).for(:total_memoria_ram)
      end

      should_not allow_value(3).for(:total_memoria_ram)
      should_not allow_value(13).for(:total_memoria_ram)
      should_not allow_value(16.5).for(:total_memoria_ram)
    end

    it 'valida presença e valor boolean do video_integrado' do
      [true, false].each do |v|
        should allow_value(v).for(:video_integrado)
      end

      should_not allow_value(nil).for(:video_integrado)
    end
  end
end
