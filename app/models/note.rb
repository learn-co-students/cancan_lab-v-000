class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :add_author_to_readers

  def visible_to=(string)
    readers << string.split(", ").map{|name| User.find_by(name: name)}
  end

  def visible_to
    readers.map{|reader| reader.name}.join(", ")
  end

  def add_author_to_readers
    if user && !readers.include?(user)
      readers << user
    end
  end
  
end
