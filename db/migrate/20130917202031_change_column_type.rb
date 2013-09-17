class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :comments, :recommendation, :text
  end
end
