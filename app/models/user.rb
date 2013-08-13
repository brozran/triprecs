class User < ActiveRecord::Base

  has_many :trips
  has_many :trip_details, :through => :trips
  has_many :comments, :through => :trip_details
  # is this possible????

  has_secure_password
end
