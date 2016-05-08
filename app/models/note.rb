class Note < ActiveRecord::Base
  has_many :viewers
  belongs_to :user
  has_many :readers, through: :viewers, source: :user

  def visible_to=(list)
    names = list.split(", ")
    names.each do |name|
      self.readers << User.find_by(name: name)
    end
  end

  def visible_to
    a = []
    self.readers.each do |reader|
      a << reader.name
    end
    a.join(", ")
  end
end
