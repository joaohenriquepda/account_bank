class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.float :amount
      t.references :source_account, :as=> :account
      t.references :destination_account, :as=> :account
      t.timestamps
    end
  end
end
