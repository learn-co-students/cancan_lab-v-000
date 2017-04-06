class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  before_save :owner_can_read

  def visible_to
    name_array = self.readers.collect do |reader|
      reader.name
    end
    name_array.join(', ')
  end

  def visible_to=(list)
    users = list.split(', ')

    self.readers = users.map do |user|
      User.find_by(name: user)
    end
  end

  def owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
