class Api::V1::ComponentesController < ApplicationController
    before_action :autenticacao

    def get_processadores
        @processadores = Processador.all

        render json: @processadores
    end

    def get_placas_mae
        @placas_mae = PlacaMae.all

        render json: @placas_mae
    end

    def get_memorias_ram
        @memorias_ram = MemoriaRam.all

        render json: @memorias_ram
    end

    def get_placas_de_video
        @placas_de_video = PlacaDeVideo.all

        render json: @placas_de_video
    end

    private

    def autenticacao
      token = request.headers['Authorization']
      if token.present?
        begin
          decoded_token = JsonWebTokenService.decode(token.split(' ').last)
          usuario_id = decoded_token['usuario_id']
          @current_user = Usuario.find_by(id: usuario_id)
          unless @current_user
            render json: { error: "Não Autorizado!" }, status: :unauthorized
          end
        rescue => e
          render json: { error: "Token Inválido!" }, status: :unauthorized
        end
      else 
        render json: { error: "Authorization não informado no Header." }, status: :unauthorized
      end
    end
end
