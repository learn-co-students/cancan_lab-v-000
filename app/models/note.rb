class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_update :user_reader

  def visible_to=(names)
    self.readers = names.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  def visible_to
    self.readers.map do |reader|
      reader.name
    end.join(", ")
  end

  def user_reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
