class User < ActiveRecord::Base
  validates :email, :uniqueness => true

  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone, :presence => true

  belongs_to :account

end
