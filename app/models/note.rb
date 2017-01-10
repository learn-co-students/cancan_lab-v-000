class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
=begin
    # the object is saved
    def visible_to=(name_list)  
  	name_list.split(',').each do |name|
  	  readers << User.find_or_create_by(name: name.strip)
  	end
  end
=end  

# the object has not yet been saved!
  def visible_to=(name_list)
  	self.reader_ids= name_list.split(",").map do 
  	  |name| User.find_or_create_by(name: name.strip).id
  	end
  end


  def visible_to
  	readers.map{|reader| reader.name}.join(', ')
  end


end
