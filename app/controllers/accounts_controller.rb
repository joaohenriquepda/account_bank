class AccountsController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_account, except: %i[create index]


    def index 
        render json: Account.all
    end

    # GET /account/{cpf}
    def show
        render json: @account, status: :ok
    end

    # POST /account
    def create
        @account = Account.new(account_params)
        if @account.save
            render json: @account, status: :created
        else
            render json: { errors: @account.errors.full_messages },
                status: :unprocessable_entity
        end
    end

    # PUT /account/{account_id}
    def update
        unless @account.update(account_params)
        render json: { errors: @account.errors.full_messages },
                status: :unprocessable_entity
        end
    end

    # DELETE /account/{accountname}
    def destroy
        @account.destroy
    end

    private

    def find_account
        @account = Account.find_by_cpf!(params[:_cpf])
        rescue ActiveRecord::RecordNotFound
        render json: { errors: 'account not found' }, status: :not_found
    end

    def account_params
        params.permit(
            :account_balance, :name, :cpf, :email, :password, :password_confirmation
        )
    end
end
