class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :f1
      t.integer :f2
      t.boolean :confirmed
    end
  end
end
