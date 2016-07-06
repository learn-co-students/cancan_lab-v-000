class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  
  before_save :make_owner_a_reader
  
  def visible_to=(names)
    self.readers = names.split(", ").collect {|name| User.find_by(name: name.strip)}
  end
  
  def visible_to
    self.readers.collect {|reader| reader.name}.join(", ")
  end
  
  def make_owner_a_reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
