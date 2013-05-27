class Food < ActiveRecord::Base
  validates :description, :presence => true
  validates :user_id, :presence => true
  validates :status, :presence => true


  has_many :accounts
end
