class NewColumnTrips < ActiveRecord::Migration
  def change
    add_column :trips, :userid, :integer
  end
end
