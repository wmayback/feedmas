class AddClaimantToFood < ActiveRecord::Migration
  def change
    add_column :foods, :claimant, :string
  end
end
