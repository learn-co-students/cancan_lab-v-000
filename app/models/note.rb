class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(people)
    self.readers = people.split(',').collect do |name|
      User.find_by(name: name.strip)
    end
  end

  def visible_to
    readers.collect { |u| u.name }.join(', ')
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end

end
