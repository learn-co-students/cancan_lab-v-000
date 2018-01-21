class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_owner_to_readers

  def visible_to
    readers.map { |user| user.name }.join(', ')
  end

  def visible_to=(string)
    self.readers = string.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  private

  def add_owner_to_readers
    if user && readers.exclude?(user)
      readers << user
    end
  end


end
