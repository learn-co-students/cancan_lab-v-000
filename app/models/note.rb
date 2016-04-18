class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(name_string)

      self.readers = name_string.split(', ').map do |name|
        User.find_or_create_by(name: name.strip)
      end.compact
  end

  def visible_to
    self.readers.map do |reader|
      reader.name
    end.join(", ")
  end
end
