class TripDetail < ActiveRecord::Base

  belongs_to :trip
  # validates :city_or_region, :presence => true
  # validates :recommendation_needs, :presence => true


end
