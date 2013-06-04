class AddImageToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :image, :string
  end
end
