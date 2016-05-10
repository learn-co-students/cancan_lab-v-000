class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers = []
    self.readers.each do |reader|
      readers << reader.name
    end
    readers.join(", ")
  end

  def visible_to=(readers)
    readers_array = readers.split(/\s*,\s*/)
    readers_array.each do |reader|
      r = User.find_by(name: reader)
        if r
          self.readers << r
        end
    end
  end

end
