require 'rails_helper'

RSpec.describe Location, :type => :model do

	it "Iron Find method returns entry of id number entered" do
		item = Location.new
		item.name = "Favorite"
		item.city = "Barcelona"
		item.country = "Spain"
		item.save
		expect(Location.find(item.id)).to eq(Location.iron_find(item.id))
	end

	it "In_spain? method returns all places in Spain" do
		expect(Location.in_spain?).to eq(Location.where "country ='Spain'")
	end

	it "Last_created method returns n number of results from latest entry " do
		value = 7
		expect(Location.last_created(value)).to eq(Location.order("created_at DESC").limit(value))
	end

	it "Count_visits method returns number of total visit in that month and year" do
		location1 = Location.create name:'Beach', city: 'Mallorca', country: 'Spain'
		Visit.create location_id: location1.id, user_id: 1, from_date: Date.today, to_date: Date.today+3
		Visit.create location_id: location1.id, user_id: 2, from_date: Date.today+10, to_date: Date.today+23
		expect(Location.count_visits(8,2014,location1.id)).to eq(1)
	end

	it "Name and city is present" do
		item = Location.new
		expect(item.valid?).to eq(false)
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
