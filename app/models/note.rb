class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers  
  has_many :readers, through: :viewers, source: :user

  def visible_to=(names)
    self.readers = names.split(", ").collect do |name| 
      User.find_or_create_by(name: name)
    end
    self.readers 
  end

   def visible_to
    self.readers.collect do |reader|
      reader.name
    end.join(", ")
  end



end
