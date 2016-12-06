class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :owner_is_reader

  def visible_to
    self.readers.map{|u| u.name}.join(", ")
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(",").map{|name| User.find_by(name: name.strip)}.compact
  end

  def owner_is_reader
    readers << user if user && !readers.include?(user)
  end
end
