class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  before_save :owner_can_read

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').collect do |name|
      User.find_by(name: name.strip)
    end.compact
  end


  def visible_to
    visible = []
    self.readers.each {|reader| visible << reader.name}
    visible.join(",").gsub(',', ', ')
  end

  def owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
 
end
