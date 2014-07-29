class Comment < ActiveRecord::Base
	belongs_to :location

validates :text_note, presence: true
validates_associated :location #because add_reference on DB

end