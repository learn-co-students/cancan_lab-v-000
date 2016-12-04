# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
users = User.create([
  {name: "fred", admin: false},
  {name: "ted", admin: false},
  {name: "ned", admin: false},
  {name: "bev", admin: true}
  ])

notes = Note.create([
  {content: "I like apples", user_id: 1},
  {content: "Can you swim?", user_id: 1},
  {content: "Find your dream", user_id: 1},

  {content: "Is this the door?", user_id: 2},
  {content: "My what a big phone you have!", user_id: 2},
  {content: "I was NOT aware of that", user_id: 2},

  {content: "Chitty bang bang", user_id: 3},
  {content: "Snorkeling on the reef", user_id: 3},
  {content: "Lobster Bisque", user_id: 3},

  {content: "Watching a chick flick", user_id: 4},
  {content: "Skateboarding prodigy, loses iPhone", user_id: 4},
  {content: "Spice Girls, actually kind of bland", user_id: 4}
  ])

viewers = Viewer.create([
  {user_id: 1, note_id: 1},
  {user_id: 1, note_id: 2},
  {user_id: 1, note_id: 3},

  {user_id: 2, note_id: 4},
  {user_id: 2, note_id: 5},
  {user_id: 2, note_id: 6},

  {user_id: 3, note_id: 7},
  {user_id: 3, note_id: 8},
  {user_id: 3, note_id: 9},


  {user_id: 2, note_id: 1},
  {user_id: 3, note_id: 1},

  {user_id: 1, note_id: 2},
  {user_id: 3, note_id: 2},

  {user_id: 1, note_id: 3},
  {user_id: 2, note_id: 3}
  ])
