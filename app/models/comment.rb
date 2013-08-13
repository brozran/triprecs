class Comment < ActiveRecord::Base

  belongs_to :trip_detail
  belongs_to :user
  belongs_to :prospect

  validates :user_id, :presence => true
end
