class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').collect do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  def visible_to
    self.readers.collect do |reader|
      reader.name
    end.join(", ")
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
