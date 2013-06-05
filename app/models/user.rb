 class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates :email, :uniqueness => true
  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone, :presence => true

  belongs_to :account

  before_create :downcase_email

  def downcase_email
  self.email = self.email.downcase
  end

end
