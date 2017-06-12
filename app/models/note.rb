class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :add_owner_to_readers

  def visible_to
    readers.map{|r| r.name}.join(", ")
  end

  def visible_to=(string)
    string.split(", ").each do |name|
      user = User.find_or_create_by(name: name)
      self.readers << user
    end
  end

  def add_owner_to_readers
    if !readers.include?(self.user)
      readers << self.user
    end
  end
end
