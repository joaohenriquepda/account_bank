class AccountsController < ApplicationController
    before_action :authorize_request, except: %i[create show index]
    before_action :find_account, except: %i[create index show_by_cpf]
    before_action :find_account_cpf, only: %i[show_by_cpf]

    def index 
        render json: Account.all
    end

    # GET /account/:account_id
    def show
        render json: @account, status: :ok
    end

    # 
    # GET /account/cpf/:cpf
    def show_by_cpf
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

    # PUT /account/:account_id
    def update
        unless @account.update(account_params)
        render json: { errors: @account.errors.full_messages },
                status: :unprocessable_entity
        end
    end

    # DELETE /account/:account_id
    def destroy
        @account.destroy
    end

    private

    def find_account_cpf
        puts "cpf"
        @account = Account.find_by_cpf!(params[:cpf])
        rescue ActiveRecord::RecordNotFound
        render json: { status: :not_found, message: 'Conta não existente' }
    end


    def find_account
        @account = Account.find_by_id!(params[:id])
        rescue ActiveRecord::RecordNotFound
        render json: { status: :not_found, message: 'Conta não existente' }
    end

    def account_params
        params.require(:account).permit(
            :account_balance, :name, :cpf, :email, :password, :password_confirmation
        )
    end
end
