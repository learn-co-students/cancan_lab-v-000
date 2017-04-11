class Note < ActiveRecord::Base
belongs_to :user
has_many :viewers
has_many :readers, through: :viewers, source: :user
before_save :ensure_owner_can_read

def visible_to
  readers.map do |reader|
    reader.name
  end.join(', ')
end

  def visible_to=(secret_readers)
  if secret_readers != ""
    readers = secret_readers.split(',')
    readers.map do | name |
     self.readers << User.find_by(name: name.strip)
    end
  end
 end


 def ensure_owner_can_read
   if user && !readers.include?(user)
     readers << user
   end
 end
#When we create a new note, we'll want a form that takes in a comma-separated list of usernames which represent who that note is visible to. We'll use utility methods on the note model which should know how to create the relationship between a note and its viewers. These readers and writers will be called visible_to and visible_to=. You should be able to use the same principles of mass assignment and "accepts_nested_attributes" to accomplish this. Use the tests as your guide.

end
