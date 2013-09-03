class AddDepartureToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :departuredate, :date
  end
end
