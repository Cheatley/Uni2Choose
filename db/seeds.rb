# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Nathalie Cochard",
             email: "nathalie.cochard7@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Bruce Scharlau",
             email: "b.scharlau@abdn.ac.uk",
             password:              "RoR-master",
             password_confirmation: "RoR-master",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Example User",
             email: "example@user.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)

40.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@uni2choose.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               admin: false,              
               activated: true,
               activated_at: Time.zone.now)

end