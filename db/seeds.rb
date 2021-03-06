# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Faker to use 'dummy data'

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

User.delete_all
Post.delete_all
Hike.delete_all

User.create(name:  "Jack Stein",
             email: "jacklsteiniv@gmail.com",
             password:              "ocosta583",
             password_confirmation: "ocosta583",
             admin: true)

User.create(name: "Fetty Wap",
            email: "fetty@wap.com",
            password: "trapqueen",
            password_confirmation: "trapqueen")

Hike.create(name: "Eaton Canyon Falls",
             city: "Altadena",
             state: "CA",
             zip: 91001)

Hike.create(name: "Griffith Park Observatory",
             city: "Los Angeles",
             state: "CA",
             zip: 90027)

# Post.create(img_url: "https://upload.wikimedia.org/wikipedia/commons/6/62/Eaton_falls.jpg",
#              user_id: 1,
#              content: "This one used to have a waterfall pre-drought. Lots of people, but a solid hike nonetheless.",
#              hike_id: 1)

# Post.create(img_url: "http://informedexplorer.com/wp-content/uploads/2013/04/Griffith-Park-Observatory.jpg",
#              user_id: 2,
#              content: "Killer views, plenty of different trails to take. Great views of the skyline, the Hollywood sign, and the beaches. Five stars! Oh yeah - dogs!",
#             hike_id: 2)

# # clean out all current data
# Hike.delete_all
# User.delete_all
# Post.delete_all




