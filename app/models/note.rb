class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_can_read

  def visible_to=(name)
    self.readers = name.split(",").map {|x| User.find_by(name: x.strip)}.compact
  end

  def visible_to
    self.readers.collect{|reader| reader.name}.join(", ")
  end
   
  private 

  def owner_can_read
    if user && !readers.include?(user)
      readers << user 
    end 
  end

end #ends class
