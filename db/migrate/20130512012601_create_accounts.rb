class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :phone
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :postcode
      t.string :logo
    end
  end
end
