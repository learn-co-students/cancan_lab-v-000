class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(list)
    names = list.split(", ")
    names.each do |name|
      user = User.find_by(name: name)
      self.readers << user
    end
  end

  def visible_to
    names = self.readers.map(&:name)
    names.join(", ")
  end
end
