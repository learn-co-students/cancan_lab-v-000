# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: 'user1')
user2 = User.create(name: 'user2')

note1 = Note.create(content: "first note", user_id: 1)
note2 = Note.create(content: "second note", user_id: 1)
note2 = Note.create(content: "third note", user_id: 2)

