class RenameUsersToAccounts < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :accounts
  end
end
