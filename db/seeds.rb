# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Nathalie",
            dob: DateTime.new(1993, 9, 13),
            gender: "Female",
            postcode: "AB24 3EX",
            email: "nathalie.cochard7@gmail.com",
            password:              "password",
            password_confirmation: "password",
            admin:     true,
            confirmed_at: Time.zone.now)

User.create!(name: "John",
            dob: DateTime.new(1993, 9, 13),
            gender: "Male",
            postcode: "AB24 3EX",
            email: "john@john.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
             
User.create!(name: "Maria",
            dob: DateTime.new(1993, 9, 13),
            gender: "Female",
            postcode: "AB24 3EX",
            email: "maria@maria.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
             
User.create!(name: "Mike",
            dob: DateTime.new(1993, 9, 13),
            gender: "Male",
            postcode: "AB24 3EX",
            email: "mike@mike.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
             
User.create!(name: "Emilie",
            dob: DateTime.new(1993, 9, 13),
            gender: "Female",
            postcode: "AB24 3EX",
            email: "emilie@emilie.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
            
User.create!(name: "Edward",
            dob: DateTime.new(1993, 9, 13),
            gender: "Male",
            postcode: "AB24 3EX",
            email: "edward@edward.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
             
User.create!(name: "Lina",
            dob: DateTime.new(1993, 9, 13),
            gender: "Female",
            postcode: "AB24 3EX",
            email: "lina@lina.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
User.create!(name: "Jason",
            dob: DateTime.new(1993, 9, 13),
            gender: "Female",
            postcode: "AB24 3EX",
            email: "jason@jason.com",
            password:              "password",
            password_confirmation: "password",
            admin:     false,
            confirmed_at: Time.zone.now)
                          

User.create!(name: "Bruce",
            dob: DateTime.new(2015, 6, 22),
            gender: "Male",
            postcode: "AB10 9FG",
            email: "b.scharlau@abdn.ac.uk",
            password:              "RoR-master",
            password_confirmation: "RoR-master",
            admin:     true,
            confirmed_at: Time.zone.now)
             
User.create!(name: "Example User",
            dob: DateTime.new(2015, 6, 22),
            gender: "Female",
            postcode: "AB24 3EX",
            email: "example@user.com",
            password:              "foobar",
            password_confirmation: "foobar",
            admin:     false,
            confirmed_at: Time.zone.now)

40.times do |n|
  name = Faker::Name.name 
  email = Faker::Internet.email
  password = "password"
  dob = Faker::Date.between(18.year.ago, 13.year.ago)
  postcode = Faker::Address.zip_code
  User.create!(name: name,
              dob: dob,
              gender: "Female",
              postcode: postcode,
              email: email,
              password: password,
              password_confirmation: password,
              admin: false,              
              confirmed_at: Time.zone.now)  
end

40.times do |n|
  name = Faker::Name.name 
  email = Faker::Internet.email
  password = "password"
  dob = Faker::Date.between(18.year.ago, 13.year.ago)
  postcode = Faker::Address.zip_code
  User.create!(name: name,
              dob: dob,
              gender: "Male",
              postcode: postcode,
              email: email,
              password: password,
              password_confirmation: password,
              admin: false,              
              confirmed_at: Time.zone.now)

end