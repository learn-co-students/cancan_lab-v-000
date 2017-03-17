class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.pluck(:name)
  end

  def visible_to=(username_list)
    list = username_list.split(',')
    list.each do |username|
     user = username.strip
     readers << User.find_by(name: user) if User.find_by(name: user)
   end
  end

end
