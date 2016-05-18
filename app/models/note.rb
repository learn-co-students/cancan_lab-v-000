class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    
  end

  def visible_to=(reader_list)
    reader_list.split(", ").each do |reader|
      user = User.find_by(name: reader)
      viewer = Viewer.create(user: user, note: self)
    end
  end

  def visible_to
    self.readers.map { |reader| reader.name }.join(", ")
  end
end
