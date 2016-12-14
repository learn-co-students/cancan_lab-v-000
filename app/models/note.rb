class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers_name = []
    readers.each{|r| readers_name << r.name}
    readers_name.join(', ')
  end

  def visible_to=(users)
    users_arr = users.split(', ')
    self.readers = users_arr.map{|u| User.find_by(name: u)}
  end

end
