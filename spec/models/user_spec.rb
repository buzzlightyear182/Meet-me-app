require 'rails_helper'

RSpec.describe User, :type => :model do

	it "Username and password is present" do
		user = User.new
		expect(user.valid?).to eq(false)
	end

	it "User is valid?" do
		user = User.new user_name:"Jane", password: '123', email: "jane.buzzlightyear@gmail.com"
		expect(user.valid?).to eq(false)
	end

	it "Email format is not correct" do
		user = User.new
		user.email = "we_love_chocolate"
		expect(user.valid?).to eq(false)
	end

	it "Username length should not be more than 10 character" do
		user = User.new
		user.user_name = "DarioJaneHeatherDeeCavanillasIglesias"
		expect(user.valid?).to eq(false)
	end

	it "Userame should only include alphanumeric characters" do
		user = User.new
		user.user_name = "Jane-*&^%$"
		expect(user.valid?).to eq(false)
	end

	it "Create a new user" do
		user = User.new
		user.user_name = "benja83"
		user.password="12345678"
		user.email = "bentarenne@gmail.com"
		expect(user.valid?).to eq(true)
	end

end
