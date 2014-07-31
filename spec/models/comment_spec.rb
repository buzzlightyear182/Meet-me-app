require 'rails_helper'
require 'pry'

RSpec.describe Comment, :type => :model do

	it 'should have a text_note and location_id' do
		location = create(:location)
		comment = Comment.new text_note: "String"
		comment.location = location
		expect(comment.valid?).to eq(true)
	end

	it 'should have a text_note' do
		location = create(:location)
		comment = Comment.create
		expect(comment.valid?).to eq(false)
	end

end
