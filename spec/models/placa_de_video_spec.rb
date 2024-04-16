require 'rails_helper'

RSpec.describe PlacaDeVideo, type: :model do

  describe 'validacoes' do
    it { is_expected.to validate_presence_of(:descricao) }
  end
end
