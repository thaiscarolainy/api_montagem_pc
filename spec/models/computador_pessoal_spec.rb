require 'rails_helper'

RSpec.describe ComputadorPessoal, type: :model do

  describe 'associacoes' do
    it { is_expected.to belong_to(:placa_mae) }
    it { is_expected.to belong_to(:processador) }
    it { is_expected.to belong_to(:placa_de_video) }
    it { is_expected.to have_many(:computador_pessoal_memorias_ram) }
    it { is_expected.to accept_nested_attributes_for(:computador_pessoal_memorias_ram) }
  end

  describe 'validacoes' do
    load File.expand_path('seeds.rb', Rails.root.to_s + '/db')

    it 'valida presença da placa de video caso placa mae não possua video_integrado' do
      placa_mae = PlacaMae.find_by_descricao("Asus ROG")
      computador_pessoal = ComputadorPessoal.new(placa_mae_id: placa_mae.id, processador_id: 1)
      computador_pessoal.save

      expect(computador_pessoal.errors[:placa_de_video_id]).to include("O Computador Pessoal precisa ter placa de video integrado. Por favor, selecione uma opção.")
    end

    it 'não valida presença da placa de video se a placa mae tiver video integrado' do
        placa_mae = PlacaMae.find_by_descricao("ASRock Steel Legend")
        computador_pessoal = ComputadorPessoal.new(placa_mae_id: placa_mae.id, processador_id: 1)
        computador_pessoal.save

        expect(computador_pessoal.errors[:placa_de_video_id]).to_not include("O Computador Pessoal precisa ter placa de video integrado. Por favor, selecione uma opção.")
    end

    #context 'valida se o computador pessoa possui memoria ram associadas' do
    #  before :each do
    #    byebug
    #    placa_mae = PlacaMae.find_by_descricao('Asus ROG')
    #    processador = Processador.find_by_descricao('Core i5')
    #    placa_de_video = PlacaDeVideo.find_by_descricao('Evga Geforce RTX 2060 6GB')
    #    @computador_pessoal = ComputadorPessoal.new(placa_mae_id: placa_mae.id, processador_id: processador.id, placa_de_video_id: placa_de_video.id)
    #  end

    #  it 'não tem memoria ram associada' do
     #   @computador_pessoal.save

     #   expect(@computador_pessoal.errors[:error]).to include("O computador deve memoria ram associada.")
    # end
    #end

    context 'valida quantidade de slot' do
      before :each do
        @placa_mae = PlacaMae.find_by_descricao("Asus ROG")
        @memoria_ram = MemoriaRam.find_by_tamanho(4)
        @computador_pessoal = ComputadorPessoal.new(placa_mae_id: @placa_mae.id, processador_id: 1 )

        2.times do
          @computador_pessoal.computador_pessoal_memorias_ram.build(memoria_ram_id: @memoria_ram.id)
        end
      end

      it 'slot disponivel para todas as memorias' do
        @computador_pessoal.save

        expect(@computador_pessoal.errors[:error]).to_not include("Placa Mãe só comporta #{@placa_mae.quantidade_slot_memoria_ram} slot de memória RAM até #{@placa_mae.total_memoria_ram}GB.")
      end

      #it 'não têm slots disponivel' do
      #  @computador_pessoal.computador_pessoal_memorias_ram.build(memoria_ram_id: @memoria_ram.id)
      #  @computador_pessoal.save

       # expect(@computador_pessoal.errors[:error]).to include("Placa Mãe só comporta #{@placa_mae.quantidade_slot_memoria_ram} slot de memória RAM até #{@placa_mae.total_memoria_ram}GB.")
      #end
    end

    context 'valida total de memoria suportada' do
      before :each do
        @placa_mae = PlacaMae.find_by_descricao("Asus ROG")
        @memoria_ram = MemoriaRam.find_by_tamanho(16)
        @computador_pessoal = ComputadorPessoal.new(placa_mae_id: @placa_mae.id, processador_id: 1 )

        @computador_pessoal.computador_pessoal_memorias_ram.build(memoria_ram_id: @memoria_ram.id)
      end

      it 'valor suportado' do
        @computador_pessoal.save

        expect(@computador_pessoal.errors[:error]).to_not include("Placa Mãe só suporta #{@placa_mae.total_memoria_ram}GB de memória RAM.")
      end

      it 'valor acima' do
        @computador_pessoal.computador_pessoal_memorias_ram.build(memoria_ram_id: @memoria_ram.id)
        @computador_pessoal.save

        expect(@computador_pessoal.errors[:error]).to include("Placa Mãe só suporta #{@placa_mae.total_memoria_ram}GB de memória RAM.")
      end
    end

    context 'valida se o processador é compativel com a placa mae' do
     # it 'compativel' do
       # placa_mae = PlacaMae.find_by_descricao('Asus ROG')
       # processador = Processador.find_by_descricao('Core i7')
       # placa_de_video = PlacaDeVideo.find_by_descricao('Asus ROG Strix Geforce RTX 3060 6GB')
       # computador_pessoal = ComputadorPessoal.new(placa_mae_id: placa_mae.id, processador_id: processador.id, placa_de_video_id: placa_de_video.id)
       # computador_pessoal.save

       # expect(computador_pessoal.errors[:error]).to_not include("Placa Mãe incompativel com o processador.")
      #end

      #it 'incompativel' do
       # placa_mae = PlacaMae.find_by_descricao('Asus ROG')
       # processador = Processador.find_by_descricao('Ryzen 7')
        #placa_de_video = PlacaDeVideo.find_by_descricao('Evga Geforce RTX 2060 6GB')
       #computador_pessoal = ComputadorPessoal.new(placa_mae_id: placa_mae.id, processador_id: processador.id, placa_de_video_id: placa_de_video.id)
       # computador_pessoal.save

       # expect(computador_pessoal.errors[:error]).to include("Placa Mãe incompativel com o processador.")
      #end

      it 'aceita ambos' do
        placa_mae = PlacaMae.find_by_descricao('ASRock Steel Legend')
        processador = Processador.find_by_descricao('Ryzen 7')
        placa_de_video = PlacaDeVideo.find_by_descricao('Gigabyte Radeon RX 6600 XT EAGLE 8GB')
        computador_pessoal = ComputadorPessoal.new(placa_mae_id: placa_mae.id, processador_id: processador.id, placa_de_video_id: placa_de_video.id)
        computador_pessoal.save

        expect(computador_pessoal.errors[:error]).to_not include("Placa Mãe incompativel com o processador")
      end
    end

  end
end
