class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  def visible_to
    self.readers.map do |reader|
      reader.name.join(", ")
    end
  end

  def visible_to=(name)
    visible = self.readers.map do |reader|
      reader = User.find_or_create_by(name: name).split(", ")
      
    end
  end

end
