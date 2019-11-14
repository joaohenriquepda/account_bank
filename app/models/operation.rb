class Operation < ApplicationRecord

    validates :amount, presence: true
    validates :option, presence: true
    validates :source_account_id, presence: true
    validates :destination_account_id, presence: true

    belongs_to :source_account, :class_name => "Account"
    has_one :destination_account, :class_name => "Account"

    def initialize(args)

        begin
            option = args[:option]
            amount = args[:amount]
            source = Account.find(args[:source_account_id])
            destination = Account.find(args[:destination_account_id])

            if option == "transfer"
                transfer source, destination, amount
                @status = { status: "error", message: self.error}
                args = defaults.merge(args)
            end
            if option == "deposit"
                deposit destination, amount
                args = defaults.merge(args)
            end
        rescue StandardError => e
            @status = { status: "error", message: e}
            args = defaults.merge(args)
        end  

        super
    
    end

    private

        # Transferência deve consultar o saldo
        def transfer source, destination, amount 
            
            if amount > source.account_balance
                raise StandardError.new 'Saldo Insuficiente'
            else
                destination.update(account_balance: destination.account_balance + amount)
                source.update(account_balance: source.account_balance - amount)
            end   
        end

        # Operação de depósito só poderá ser feita por ADM
        def deposit destination, amount
            destination.update(account_balance: destination.account_balance + amount)
        end

        # TODO - Acrescentar atributos para log das operações no sistema 
        def defaults
            {status: @status}
        end

        # def defaults_success
        #     {status: "success"}
        # end

end
