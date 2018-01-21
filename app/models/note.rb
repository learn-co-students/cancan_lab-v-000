class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(new_readers)
    if !new_readers.empty?
      self.readers = new_readers.split(", ").map{|name| User.find_by(name: name)}
    end
  end

  def visible_to
    self.readers.map{|reader| reader.name}.join(", ")
  end

end
