class AddStatusToOperation < ActiveRecord::Migration[5.2]
  def change
    add_column :operations, :status, :json, null: true, default: '{}'
  end
end
