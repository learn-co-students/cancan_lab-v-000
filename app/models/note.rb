class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(user_string)
    user_array = user_string.split(", ")
    user_array.each do |u|
      self.readers << User.find_by(name: u)
    end
  end

  def visible_to
    string = ""
    self.readers.each do |read|
      string << read.name + ", "
    end
    string[0..-3]
  end

end
