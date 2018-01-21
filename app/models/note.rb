class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read


  def visible_to=(user_readers)
    self.readers = user_readers.split(',').map do |a|
      User.find_by(name: a.strip)
    end.compact
  end

  def visible_to
    readers.map {|a| a.name}.join(', ')
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
