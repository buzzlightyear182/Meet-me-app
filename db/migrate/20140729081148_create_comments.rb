class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :text_note
    	t.references :location
      t.timestamps
    end
  end
end
