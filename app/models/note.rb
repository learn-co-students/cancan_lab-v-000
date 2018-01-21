class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(names)
    self.readers.destroy_all
    names.split(/[,]\s*/).each do |n|
      self.readers << User.find_or_create_by(name: n)
    end
    if self.user
      self.readers << self.user
    end
  end

  def user_reader=(user)
    self.user = user
    self.readers << user
  end

  def visible_to
    self.readers.map do |r|
      r.name
    end.join(', ')
  end

end
