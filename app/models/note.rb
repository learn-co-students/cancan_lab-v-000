class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers = []
    self.readers.each do |reader|
      readers << reader.name
    end
    readers.uniq.join(", ")
  end

  def visible_to=(users)
    users = users.split(", ")
    users.each do |user|
      u = User.find_or_create_by(name: user)
      self.readers << u if !self.readers.exists?(u.id)
    end
  end
end
