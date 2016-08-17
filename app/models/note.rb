class Note < ActiveRecord::Base
  belongs_to  :user
  has_many    :viewers
  has_many    :readers, through: :viewers, source:  :user
  before_save :ensure_owner_can_read

  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(names)
    names.split(",").each do |viewer|
      self.readers << User.find_by(name: viewer.strip)
    end
  end

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
