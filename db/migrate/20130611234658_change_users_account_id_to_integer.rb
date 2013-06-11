class ChangeUsersAccountIdToInteger < ActiveRecord::Migration
  def change
    change_column :users, :account_id, :integer
  end
end
