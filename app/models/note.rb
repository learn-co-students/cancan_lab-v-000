class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  before_save :ensure_owner_can_read

  def visible_to
    self.readers.map { |reader| reader.name}.join(", ")
  end

  def visible_to=(users)
    self.readers = users.split(", ").map do |name|
      user = User.find_by(name: name)
    end.compact
  end

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
