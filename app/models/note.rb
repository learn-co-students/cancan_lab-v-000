class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  
  before_update :add_reader

  def visible_to=(names)
    self.readers = names.split(',').collect do |name|
      User.find_by(name: name.strip)
    end

    self.readers
  end

  def visible_to
    readers = self.readers.collect do |reader|
      reader.name
    end

    readers.join(", ")
  end

  private 

  def add_reader
    if !readers.include?(user)
      readers << user
    end
  end
end