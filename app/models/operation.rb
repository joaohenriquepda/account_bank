class Operation < ApplicationRecord

    validates :amount, presence: true
    validates :source_account_id, presence: true
    validates :destination_account_id, presence: true

    belongs_to :source_account, :class_name => "Account"
    has_one :destination_account, :class_name => "Account"
    

end
