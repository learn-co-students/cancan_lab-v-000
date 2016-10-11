class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :can_read

  def visible_to=(users)
    self.readers = users.split(", ").collect { |user| User.find_by(name: user.strip) }
  end

  def visible_to
    self.readers.collect { |user| user.name }.join(", ")
  end

  def can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
