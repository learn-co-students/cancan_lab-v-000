class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers 
  has_many :readers, through: :viewers, source: :user

  before_save :owner_can_read_notes

  def visible_to
    self.readers.collect do |reader|
      reader.name
    end.join(', ')
  end
  
  def visible_to=(user_names)
    self.readers = user_names.split(',').collect do |user_name|
      User.find_by(name: user_name.strip)
    end.compact
  end
  
  private 
  
  def owner_can_read_notes
    if self.user && !self.readers.include?(user)
      self.readers << user
    end
  end
end
