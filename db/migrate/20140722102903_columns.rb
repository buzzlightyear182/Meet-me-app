class Columns < ActiveRecord::Migration
  def change
  	add_column :visits, :location_id, :integer
  	add_column :visits, :user_id, :integer
  	add_column :visits, :from_date, :date
  	add_column :visits, :to_date, :date
  end
end
