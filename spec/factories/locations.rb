FactoryGirl.define do
	factory :location do 
		name "Favorite"
		city "Barcelona"
		country "Spain"
	end
	factory :location_invalid do 
		city "Barcelona"
		country "Spain"
	end
end
