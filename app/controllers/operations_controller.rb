class OperationsController < ApplicationController

    #GET /operations
    def index
        render json: Operation.all.order("created_at DESC")
    end

    # POST /operations
    def create

        jwt_account_id = JsonWebToken.decode(request.headers["Authorization"])["account_id"]
        if jwt_account_id == params[:source_account_id] 
            @operation = Operation.create operations_params  
            render json: @operation
        else
            render json: { status: "error", message: "Não é possível realizar essa opção por outra conta" }
        end
   
    end

    private
        def operations_params
            params.require(:operation).permit(
                :amount, :source_account_id, :destination_account_id, :option
            )
        end


end
