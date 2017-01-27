class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(list_of_readers)
    self.readers = list_of_readers.split(', ').collect do |reader|
      User.find_or_create_by(name: reader.strip)
    end.compact
  end

  def visible_to
    readers_list = self.readers.collect do |user|
      user.name
    end

    readers_list.join(', ')
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
