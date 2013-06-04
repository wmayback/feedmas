class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :status
      t.integer :account_id
      t.integer :claimant_id
      t.string :description
    end
  end
end
