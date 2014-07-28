require 'rails_helper'

RSpec.describe Search, :type => :model do

	it 'should return nothing' do
		@search = Search.new
		expect (@search.search('Spain')).to eq([]);
	end

end
