require 'rails_helper'

RSpec.describe ComputadorPessoalMemoriaRam, type: :model do

  describe 'associacoes' do
    it { is_expected.to belong_to(:computador_pessoal) }
    it { is_expected.to belong_to(:memoria_ram) }
  end
end
