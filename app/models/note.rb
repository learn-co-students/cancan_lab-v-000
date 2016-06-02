class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :check_owner_reader

  def visible_to
    readers.collect { |user| user.name}.join(', ')
  end

  def visible_to=(added_readers)
    self.readers = added_readers.split(',').collect { |user|
      User.find_by(name: user.strip)
    }
  end

  private

  def check_owner_reader
    if user && !readers.include?(user)
      readers << user
    end
  end

end
