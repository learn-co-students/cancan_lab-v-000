class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.collect(&:name).join(', ')
  end

  def visible_to=(userlist)
    self.readers.clear
    userlist.split(',').each do |name|
      user = User.find_by(name: name.strip)
      self.readers << user
    end
  end
end
