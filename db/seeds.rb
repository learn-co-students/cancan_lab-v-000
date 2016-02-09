# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alice = User.create(name: "alice")
beth = User.create(name: "beth")
eve = User.create(name: "eve")

alice_private = Note.create(content: "I am a secret just for Alice.", user_id: alice.id)
alice_to_beth = Note.create(content: "This is a secret for Beth's eyes only!", user_id: alice.id)
beth_to_eve = Note.create(content: "I'm sorry you and Alice are still fighting.", user_id: beth.id)
eve_private = Note.create(content: "Subjects are beginning to exhibit signs of trust. Operation proceeds.", user_id: eve.id)

alice_private_join = Viewer.create(note_id: alice_private.id, user_id: alice.id)
alice_to_beth_join = Viewer.create(note_id: alice_to_beth.id, user_id: beth.id)
beth_to_eve_join = Viewer.create(note_id: beth_to_eve.id, user_id: eve.id)
eve_private_join = Viewer.create(note_id: eve_private.id, user_id: eve.id)