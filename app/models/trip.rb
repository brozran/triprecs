class Trip < ActiveRecord::Base

  has_many :trip_details
  validates :trip_name, :presence => true
  belongs_to :user

end
