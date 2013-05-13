class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :account_id
      t.string :phone
      t.string :mphone
      t.string :fax
    end
  end
end
