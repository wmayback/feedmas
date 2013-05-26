class RenameMapsColumns < ActiveRecord::Migration
  def change
    rename_column :accounts, :lat, :latitude
    rename_column :accounts, :lng, :longitude
  end


end
