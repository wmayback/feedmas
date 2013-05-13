class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :status
      t.string :user_id
      t.string :description
      t.string :user_id
    end
  end
end
