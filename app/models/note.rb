class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :visible_to_user

  def visible_to=(list)
    self.readers = list.split(", ").map{|name| User.find_by(name: name)}
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
