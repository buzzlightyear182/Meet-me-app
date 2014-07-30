FactoryGirl.define do
	factory :visit do
		user_id 1
		from_date Date.today+5
		to_date Date.today+9
		place
		# association :location
		
		factory :place do
			name "Favorite"
			city "Barcelona"
			country "Spain"

		factory :place_with_visits
		transient do
			visits_count 2
		end

		after(:create) do |place, evaluator|
        create_list(:visit, evaluator.visits_count, place: place)
      	end

		end
	end
end
