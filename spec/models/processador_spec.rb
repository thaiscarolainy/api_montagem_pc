require 'rails_helper'

RSpec.describe Processador, type: :model do
  describe 'validacoes' do
    it { is_expected.to validate_presence_of(:descricao) }
    it { is_expected.to validate_presence_of(:marca) }
  end
end