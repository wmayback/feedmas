class Account < ActiveRecord::Base

  acts_as_gmappable
  attr_accessible :address_line1, :city, :state, :logo, :postcode, :gmaps, :latitude, :longitude, :image

  validates :account_name, :uniqueness => true
  validates :account_name, :presence => true
  validates :phone, :presence => true
  validates :address_line1, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :postcode, :presence => true
  validates :category, :presence => true

  has_many :users
  has_many :foods

  mount_uploader :image, ImageUploader

  before_create :titleize_account_name

  def titleize_account_name
    self.account_name = self.account_name.titleize
  end

  def self.has_food
    joins(:foods)
  end

  def gmaps4rails_address
    "#{address_line1}, #{city}, #{state}, #{postcode}"
  end

  def gmaps4rails_infowindow

      "<div><div><b>#{account_name}</b></div> <b> #{address_line1},
    <div> #{city}, #{state} #{postcode} </div> </b>
    <div> Phone: #{phone} </div>"


  end
end


