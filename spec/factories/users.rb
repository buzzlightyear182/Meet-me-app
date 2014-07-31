FactoryGirl.define do
	factory :user do 
		user_name "Jane"
		password '12345678'
		email "jane.buzzlightyear@gmail.com"

		factory :user_invalid  do
			password "123"
		end
	end
end
