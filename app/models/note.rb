class Note < ActiveRecord::Base
    has_many :viewers
    has_many :readers, through: :viewers, source: :user
    belongs_to :user
    # validates :content, presence: true
    # accepts_nested_attributes_for :note
    
    def visible_to=(viewer)
      viewers = viewer.split(",")
      viewers.each do |each_viewer|
        self.readers << User.find_by(:name => each_viewer.strip)
      end
      self.save
    end
    
    def visible_to
        viewer_string = ""
        self.readers.each_with_index do |reader, index|
            if index > 0
                viewer_string += ", " + reader.name
            else
                viewer_string += reader.name
            end
        end
        viewer_string
    end
    
end
