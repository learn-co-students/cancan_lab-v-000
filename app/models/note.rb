require 'pry'
class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :visible_to_user

  def visible_to=(list_of_users)
    
    self.readers = list_of_users.split(", ").map{|user| User.find_by(name: user)}
  end

  def visible_to 
    self.readers.map{|reader| reader.name}.join(", ")
  end

  def visible_to_user
    if self.user
      self.readers << self.user
    end
  end
end
