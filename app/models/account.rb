class Account < ActiveRecord::Base
  validates :account_name, :uniqueness => true
  validates :account_name, :presence => true
  validates :phone, :presence => true
  validates :address_line1, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :postcode, :presence => true

  has_many :users
end
