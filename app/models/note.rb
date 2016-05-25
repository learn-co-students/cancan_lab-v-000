class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_can_read
 
  def visible_to=(readers)
   if readers
     self.readers = readers.split(', ').collect{|name| User.find_by(name: name)}
   end
  end

  def visible_to
   readers.collect{|reader| reader.name}.join(', ')
  end

  private

  def owner_can_read
   if user && !readers.include?(user)
     readers << user
   end
  end
end