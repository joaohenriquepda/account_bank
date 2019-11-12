class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    # POST /auth/login
    def login
        @account = Account.find_by_cpf(params[:cpf])
        if @account&.authenticate(params[:password])
        token = JsonWebToken.encode(account_id: @account.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                        cpf: @account.cpf }, status: :ok
        else
        render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    private

        def login_params
            params.permit(:email, :password)
        end
        
end
