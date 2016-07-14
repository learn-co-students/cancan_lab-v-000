class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  
  
  def visible_to=(list)
    list.split(", ").each {|reader| self.readers << User.find_or_create_by(name: reader)}
  end
  
  def visible_to
    self.readers.map {|reader| reader.name}.join ", "
  end
end
