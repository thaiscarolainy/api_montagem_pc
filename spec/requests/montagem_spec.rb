require 'rails_helper'

RSpec.describe "Api::V1::Montagens", type: :request do
    let(:usuario) { FactoryBot.create(:usuario) }

    before(:each) do
        sign_in usuario
    end

    describe "POST /create" do
        load File.expand_path('seeds.rb', Rails.root.to_s + '/db')
         
        it 'pedido de montagem com sucesso' do
            #post '/login', params: { email: "admin@example.com", password: "123456" }

            post '/api/v1/montagem', params: {
                    montagem: {
                        placa_mae_id: 5,
                        processador_id: 6,
                        placa_de_video_id: 6,
                        computador_pessoal_memorias_ram_attributes: [
                            {
                                memoria_ram_id: 6
                            },
                            {
                                memoria_ram_id: 7
                            }
                        ]
                    }
                }, headers: { 'Authorization': "#{Bearer usuario.username}" }
  
            
            data_json = JSON.parse(
                '{
                    "montagem": {
                        "placa_mae_id": 5,
                        "processador_id": 6,
                        "placa_de_video_id": 6,
                        "computador_pessoal_memorias_ram_attributes": [
                            {
                                "memoria_ram_id": 6
                            },
                            {
                                "memoria_ram_id": 7
                            }
                        ]
                    }
                }'
            )
            
            post api_v1_montagens_path(data_json) #headers: { 'Authorization': response.headers['Authorization'] }, params: { (data_json)} 

            expect(response).to have_http_status(200)
        end

        it 'pedido de montagem com erro' do
            post api_v1_montagens_path

            expect(response).to have_http_status(422)
        end
    end

end
