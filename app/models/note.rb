class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  attr_reader :visible_to

  def visible_to=(usernames)
    self.readers.clear
    usernames.split(", ").each do |user|
      self.readers << User.find_by(name: user)
    end
    self.readers << User.find(self.user.id)
  end


end
