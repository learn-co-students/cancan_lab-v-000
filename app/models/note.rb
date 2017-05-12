class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(list)
    readers = list.split(/\s*,\s*/)
    self.save
    readers.each do |reader|
      user = User.find_by(name: reader)
      Viewer.create(user_id: user.id, note_id: self.id)
    end
  end

  def visible_to
    list = []
    self.readers.each do |user|
      list << user.name
    end
    list = list.join(", ")
  end

end
