class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def add_user_to_reader
    if !self.readers.include?(user)
      self.readers << user
    end
  end

  def visible_to=(users_hash)
      users_hash.split(", ").collect do |user|
        add_user = User.find_by(name: user)
        self.readers << add_user  if !self.readers.include?(add_user)
    end
  end

  def visible_to
    self.readers.collect{|user| user.name}.join(", ")
  end
end
