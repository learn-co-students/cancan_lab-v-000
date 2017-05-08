class Note < ApplicationRecord
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  
  before_save :add_readers

  # Note visible_to= takes a comma separated list of names, trims spaces, and makes those users readers
  def visible_to=(users)
    self.readers = users.split(", ").map { |user| User.find_by(name: user) }
  end

  # returns reader names as a comma-separated string
  def visible_to
    self.readers.map {|reader| reader.name}.join(", ")
  end

  def add_readers
    readers << user if user && !readers.include?(user)
  end
end
