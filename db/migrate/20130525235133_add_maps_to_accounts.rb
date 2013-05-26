class AddMapsToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :lat,  :float
    add_column :accounts, :lng, :float
    add_column :accounts, :gmaps, :boolean
  end
end
