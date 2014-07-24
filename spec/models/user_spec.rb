require 'rails_helper'

RSpec.describe User, :type => :model do

	it "Username and password is present" do
		user = User.new
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

end
