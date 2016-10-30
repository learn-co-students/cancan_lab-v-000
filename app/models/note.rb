class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :give_permission

  # use principles of mass assignment
  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  private
  
  def give_permission
    if user && !self.readers.include?(user)
      self.readers << user
    end
  end
end
