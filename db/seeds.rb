a = User.create(name: "alice")
b = User.create(name: "beth")
c = User.create(name: "eve")

Note.create(content: "I am a secret just for Alice.",
  user_id: a.id)
Note.create(content: "This is a secret for Beth's eyes only!",
  user_id: a.id)
Note.create(content: "I'm sorry you and Alice are still fighting.",
  user_id: b.id)
Note.create(content: "Subjects are beginning to exhibit signs of trust. Operation proceeds.", user_id: c.id)

Viewer.create(note_id: 1, user_id: 1)
Viewer.create(note_id: 2, user_id: 2)
Viewer.create(note_id: 3, user_id: 3)
Viewer.create(note_id: 4, user_id: 3)
