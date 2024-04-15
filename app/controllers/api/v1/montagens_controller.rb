class Api::V1::MontagensController < ApplicationController
  before_action :autenticacao
  #before_action :set_montagem, only: %i[ show update destroy ]

  # GET /montagens
  def index
    @montagens = ComputadorPessoal.all

    render json: @montagens
  end

  # GET /montagens/1
  def show
    render json: @montagem
  end

  # POST /montagens
  def create
    @montagem = ComputadorPessoal.new(montagem_params)
    @montagem.usuario_id = @current_user.id
    if @montagem.save
      render json: {status: 'Sucesso', message:'Requisição Salva com sucesso.', data: @montagem }, status: :ok
    else
      render json: {status: 'Error', message:'Requisição falhou. Verifique os errors apresentados.', data: @montagem.errors.messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /montagens/1
  def update
    if @montagem.update(montagem_params)
      render json: @montagem
    else
      render json: @montagem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /montagens/1
  def destroy
    @montagem.destroy
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
    # Use callbacks to share common setup or constraints between actions.
    def set_montagem
      @montagem = ComputadorPessoal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def montagem_params
      params.require(:montagem).permit(:placa_mae_id, :processador_id, :placa_de_video_id, :usuario_id, computador_pessoal_memorias_ram_attributes: [:id, :memoria_ram_id, :_destroy])
    end
end
