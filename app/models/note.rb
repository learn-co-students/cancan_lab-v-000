class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(names)
    usernames = names.split(', ')
    usernames.each do |username|
      user = User.find_by(name: username)
      self.readers << user
    end
  end

  def visible_to
    self.readers.collect(&:name).join(', ')
  end
  
end
