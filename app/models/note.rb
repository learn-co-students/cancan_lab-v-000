class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  before_save :add_to_readers

  def visible_to=(names)
    self.readers = names.split(', ').map do |name|
      User.find_or_create_by(name: name)
    end
  end

  def visible_to
    self.readers.map{|user| user.name}.join(", ")
  end

  def add_to_readers
    readers << user if user && !readers.include?(user)
  end
end
