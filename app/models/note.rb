class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read
  def visible_to 
    # visible_to returns reader names as a comma-separated string
   readers.map do |reader|
      reader.name
    end.join(', ')
  end

  def visible_to=(user_list)
    #takes a comma separated list of names, trims spaces, and makes those users readers
    self.readers = user_list.split(',').collect do |username|
      User.find_by(name: username.strip)
    end.compact
    
  end


  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
