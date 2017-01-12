class Note < ActiveRecord::Base
  belongs_to :user

  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(reader_list)
    self.readers = reader_list.split(",").map do |name|
      User.find_by(name: name.strip)
    end
  end

  def visible_to
    readers.map do |user|
      user.name
    end.join(", ")
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end

end
