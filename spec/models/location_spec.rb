require 'rails_helper'

RSpec.describe Location, :type => :model do

	it "Iron Find method returns entry of id number entered" do

		location = create(:location)
		expect(Location.find(location.id)).to eq(Location.iron_find(location.id))
	end

	it "In_spain? method returns all places in Spain" do
		expect(Location.in_spain?).to eq(Location.where "country ='Spain'")
	end

	it "Last_created method returns n number of results from latest entry " do
		value = 7
		expect(Location.last_created(value)).to eq(Location.order("created_at DESC").limit(value))
	end

	it "Count_visits method returns number of total visit in that month and year" do
		location = create(:place_with_visits)
		expect(Location.count_visits(8,2014,location.id)).to eq(2)
	end

	it "Name and city is present" do
		location = build(:location_invalid)
		expect(location.valid?).to eq(false)
	end

	it "Name length should not be more than 30 character" do
		item = Location.new
		item.name = "DarioJaneHeatherDeeCavanillasIglesiasTamarloDeLaRosaBrunette"
		expect(item.valid?).to eq(false)
	end

	it "Name should only include alphanumeric characters" do
		item = Location.new
		item.name = "DarioJaneHeatherDee-*&^%$"
		expect(item.valid?).to eq(false)
	end

end
