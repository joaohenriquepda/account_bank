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
                transfer amount,source,destination
            end
            if option == "deposit"
                deposit destination, amount
            end
        rescue StandardError => e
            self.errors.add(:unauthorized, "Problema com as contas informadas")
        end  
            
        super   
    end

    private
        def transfer source, destination, amount 
            if amount > source.account_balance
                self.errors.add(:unauthorized, "Saldo insuficiente")
            else
                destination.update(account_balance: destination.account_balance + amount)
            end   
        end

        def deposit destination, amount
            destination.update(account_balance: destination.account_balance + amount)
        end


end
