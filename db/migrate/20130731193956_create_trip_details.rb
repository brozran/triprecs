class CreateTripDetails < ActiveRecord::Migration
  def change
    create_table :trip_details do |t|
      t.string :city_or_region
      t.string :recommendation_needs
      t.integer :trip_id
    end
  end
end
