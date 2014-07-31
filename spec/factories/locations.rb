FactoryGirl.define do
	factory :location do 
		name "Favorite"
		city "Barcelona"
		country "Spain"
		association :user

		factory :location_invalid  do
			name ""
		end
	end
end
