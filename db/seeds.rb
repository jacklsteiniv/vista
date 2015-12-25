# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hikes = Hike.create([{
  name: "Griffith Park Observatory Trail",
  city: "Los Angeles",
  state: "California",
  zip: 90027
  },
  {name: "Solstice Canyon",
   city: "Malibu",
   state: "California",
   zip: 90265
  }

  ])
