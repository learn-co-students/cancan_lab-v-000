class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(names)
    self.readers = names.split(",").map {|name| User.find_by(name: name.strip)}.compact
  end

  def visible_to
    self.readers.map {|user| user.name}.join(", ")
  end

  def ensure_owner_can_read
  if user && !readers.include?(user)
    readers << user
  end
end

end
