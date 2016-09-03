# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  alice = User.create(name: 'alice')
  beth = User.create(name: 'beth')
  eve = User.create(name: 'eve')
  alice_private= Note.create( content: "I am a secret just for Alice.",
    user_id: 1)

  alice_to_beth= Note.create(content: "This is a secret for Beth's eyes only!",
    user_id: 1)

  beth_to_eve = Note.create(content: "I'm sorry you and Alice are still fighting.",
    user_id: 2 )

  eve_private = Note.create( content: "Subjects are beginning to exhibit signs of trust. Operation proceeds.",
    user_id: 3)
