class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :reader_user

  def visible_to=(string)


    self.readers = string.split(", ").collect {|x| User.find_by(name: x) }
    
  end

  def visible_to
    
    self.readers.collect{|x| x.name}.join(", ")
  end

  def reader_user
    if self.user
      self.readers << self.user
    end


  end
end
