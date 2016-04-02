class Note < ActiveRecord::Base
    belongs_to :user
    has_many :viewers
    has_many :readers,through: :viewers,source: :user
    
    def visible_to
      lasagna=self.readers.collect do |reader|
        reader.name
      end
      lasagna.join(", ")
    end
    
    def visible_to=(names)
       names.split(",").each do |name|
         self.readers << User.find_by(name: name.strip)     
      end
      self.readers
    end
end
