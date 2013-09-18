class User < ActiveRecord::Base

  has_many :trips
  has_many :friends
  has_many :trip_details, :through => :trips
  has_many :comments, :through => :trip_details
  # validates :email, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_secure_password
end
