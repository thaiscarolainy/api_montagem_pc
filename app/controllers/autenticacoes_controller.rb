class AutenticacoesController < ApplicationController
    def login 
        usuario = Usuario.find_by(email: params[:email])
        if usuario && usuario.valid_password?(params[:password])
            token = JsonWebTokenService.encode(usuario_id: usuario.id)
            render json: { token: token}, status: :ok
        else 
            render json: { error: "Email ou Senha inválidos!" }, status: :unauthorized
        end
    end
end
