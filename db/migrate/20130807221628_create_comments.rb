class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :recommendation
      t.integer :trip_detail_id
      t.integer :user_id
    end
  end
end
