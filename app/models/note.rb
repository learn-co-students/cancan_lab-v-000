class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    list = []
    self.readers.each do |user|
      list << user.name
    end
    list.join(', ')
  end

  def visible_to=(list)
    @list = list.split(', ')
    @list.each do |name|
      self.readers << User.find_by(name: name)
    end
  end
end
