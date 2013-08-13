class ProspectIDtoComments < ActiveRecord::Migration
  def change
    add_column :comments, :prospect_id, :integer
  end
end
