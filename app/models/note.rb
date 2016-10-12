require 'pry'
class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  def visible_to
    self.readers.collect {|user| user.name}.join(", ")
  end

  def visible_to=(users)
    self.readers = users.split(", ").map {|name| User.find_by(name: name.strip)}
  end

  def note_author
    User.find_by_id(self.user_id)
  end

end
