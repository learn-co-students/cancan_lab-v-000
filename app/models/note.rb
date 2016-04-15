class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

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
