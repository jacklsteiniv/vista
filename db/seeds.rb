# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# hikes = Hike.create([{
#   name: "Griffith Park Observatory Trail",
#   city: "Los Angeles",
#   state: "California",
#   zip: 90027
#   },
#   {name: "Solstice Canyon",
#    city: "Malibu",
#    state: "California",
#    zip: 90265
#   }

#   ])

posts = Post.create([{
  user_id: 1,
  img_url: 'http://www.seanbaello.com/wp-content/uploads/2013/02/observatory-run-31.jpg',
  text: 'Griffith Park Observatory is a great hike. You have many paths to choose from, and an amazing view at the top. Also, a lot of dogs!'
  }

  ])
