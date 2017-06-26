class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :permit_owner_can_read

  def visible_to=(new_readers)
    self.readers = new_readers.split(", ").collect { |user| User.find_by(name: user) }
  end
  
  def visible_to
    self.readers.collect { |reader| reader.name }.join(", ")
  end

  private

  def permit_owner_can_read
    if !readers.include?(user)
      readers << user
    end
    
  end  

end
