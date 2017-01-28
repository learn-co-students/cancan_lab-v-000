class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  
  def visible_to=(users)
    users.split(',').each do |u|
      u.strip!
      user = User.find_or_create_by(name: u)
      self.readers << user
      user.viewers << self.viewers.last
    end
    #binding.pry
  end
  
  def visible_to
    rdrs = []
    self.readers.each do |reader|
      rdrs << reader.name
    end
    rdrs.join(", ")
  end
  
end
