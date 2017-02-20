class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, :through => :viewers, :source => :user

  def visible_to
  	self.readers.map { |r| r.name }.join(", ")
  end

  def visible_to=(users_string)
    users = users_string.split(", ")
  	users.each do |user|
  		self.readers << User.find_by(name: user)
  	end
  end

end
