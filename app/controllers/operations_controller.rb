class OperationsController < ApplicationController

    SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

    # POST /operations
    def transfer
        begin
            if JsonWebToken.decode(request.headers["Authorization"])["account_id"] == params[:source_account_id] 
                Operation.create operations_params
                render json: {status: "Success", message: "Operação finalizada com sucesso" }
            else
                render json: {status: "unauthorized", message: "Não é permitido executar essa ação por outro usuário" }
            end
        rescue StandardError => e
            render json: {status: "error", message: e.message}
        end 
    end

    private
        def operations_params
            params.permit(
                :amount, :source_account_id, :destination_account_id, :option
            )
        end


end
