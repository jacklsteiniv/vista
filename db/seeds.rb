# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Faker to use 'dummy data'

# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: true)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

# Hike.create!(name: "Griffith Park Observatory Trail",
#              city: "Los Angeles",
#              state: "CA",
#              zip: 90027)

Post.create!(img_url: "http://www.seanbaello.com/wp-content/uploads/2013/02/observatory-run-31.jpg",
             user_id: 101,
             content: "This is a great hike for people of all ages. You are rewarded with stunning views of the Los Angeles skyline, the Hollywood sign, and the ocean. Also, lots of dogs! Highly recommended.")

# # clean out all current data
# Hike.delete_all
# User.delete_all
# Post.delete_all

# hike1 = Hike.create!(
#   name: "Griffith Park Observatory",
#    city: "Los Angeles",
#    state: "CA",
#    zip: "90027"
# )

# users = User.create!([
#   {name: "Jack Stein",
#     email: "jacklsteiniv@gmail.com",
#     password: "ocosta583"}
# ])

# posts = Post.create!([
#   {user_id: 1,
#   img_url: 'http://www.seanbaello.com/wp-content/uploads/2013/02/observatory-run-31.jpg',
#   text: 'Griffith Park Observatory is a great hike. You have many paths to choose from, and an amazing view at the top. Also, a lot of dogs!'}

# ])


