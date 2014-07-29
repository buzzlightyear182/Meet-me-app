class Change < ActiveRecord::Migration
  def change
  	remove_column :comments, :location_id
  	add_reference :comments, :location, index: true
  end
end
