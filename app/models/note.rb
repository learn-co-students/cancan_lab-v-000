class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, -> { order "name ASC" }, through: :viewers, source: :user

  belongs_to :user

  accepts_nested_attributes_for :viewers

  def visible_to=(reader_names)
    reader_names.split(", ").each do |reader_name|
      @user = User.find_or_create_by(name: reader_name.strip)
      @viewer = Viewer.create(note_id: self.id, user_id: @user.id)

      self.viewers << @viewer if !(self.viewers.include?(@viewer))
      self.save
    end
  end

  def visible_to
    self.readers.map do |reader|
      reader.name
    end.join(", ")
  end
end
