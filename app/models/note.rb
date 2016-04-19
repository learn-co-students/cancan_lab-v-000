class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(users)
    self.readers = users.split(',').collect do |name|
      User.find_by(name: name.strip)
    end
  end

  def visible_to
    array = []
    self.readers.collect do |user|
      array << user.name
    end
    array = array.join(", ")
  end

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
