class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :user_can_read

  def visible_to=(names)
    names.split(", ").each do |name| 
      self.readers << User.find_or_create_by(name: name)
    end
    self.readers
  end

  def visible_to
    self.readers.collect { |a| a.name }.join(", ")
  end

  def user_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
