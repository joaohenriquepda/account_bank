class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :password_digest
      t.float :account_balance

      t.timestamps
    end
  end
end
