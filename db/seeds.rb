# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

location1 = Location.create name:'Beach', city: 'Mallorca', country: 'Spain'
location2 = Location.create name:'Center', city: 'Madrid', country: 'Spain'
location3 = Location.create name:'Learn', city: 'Ironhack', country: 'Spain'
location4 = Location.create name:'Eat', city: 'Valencia', country: 'Spain'
location5 = Location.create name:'Art', city: 'Barcelona', country: 'Spain'
# Location.create name:'Jokes', city: 'Lepe', country: 'Spain'
# Location.create name:'Dance', city: 'Seville', country: 'Spain'
# Location.create name:'Rocks', city: 'Bilbao', country: 'Spain'

user1 = User.create user_name:"Jane", password: '123', email: "jane.buzzlightyear@gmail.com"
user2 = User.create user_name:"Ricard", password: '123', email: "rcsole@gmail.com"
user3 = User.create user_name:"Kristian", password: '123', email: "kristiankyvik@gmail.com"
user4 = User.create user_name:"Ben", password: '123', email: "bentarenne@gmail.com"
user5 = User.create user_name:"Cat", password: '123', email: "cat1788@gmail.com"

Visit.create location_id: location1.id, user_name: user1.id, from_date: Date.today+12, to_date: Date.today+14
Visit.create location_id: location2.id, user_name: user1.id, from_date: Date.today, to_date: Date.today+2
Visit.create location_id: location2.id, user_name: user2.id, from_date: Date.today, to_date: Date.today+5
Visit.create location_id: location3.id, user_name: user3.id, from_date: Date.today+3, to_date: Date.today+10
Visit.create location_id: location4.id, user_name: user4.id, from_date: Date.today+5, to_date: Date.today+12
# Visit.create location_id: 6, user_name: "Xavier", from_date: Date.today, to_date: Date.today+3
# Visit.create location_id: 9, user_name: "Sergio", from_date: Date.today, to_date: Date.today+2
# Visit.create location_id: 9, user_name: "Nick", from_date: Date.today, to_date: Date.today+2
# Visit.create location_id: 5, user_name: "Elena", from_date: Date.today, to_date: Date.today+4
# Visit.create location_id: 5, user_name: "Kiko", from_date: Date.today, to_date: Date.today+4