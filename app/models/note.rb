class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_creator_to_readers

  def visible_to=(name_string)
      self.readers = name_string.split(', ').map do |name|
        User.find_or_create_by(name: name.strip)
      end.compact
  end

  def visible_to
    self.readers.map do |reader|
      reader.name
    end.join(", ")
  end

  def add_creator_to_readers
    if user && !readers.include?(user)
      readers << user
    end
  end
end
