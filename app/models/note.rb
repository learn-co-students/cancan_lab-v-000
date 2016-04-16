class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.readers.collect{|reader| reader.name}.join(", ")
  end

  def visible_to=(users)
    users.split(", ").each do |u|
      user = User.find_by(name:u)
      self.readers.push(user)
    end
    self.save
  end
end
