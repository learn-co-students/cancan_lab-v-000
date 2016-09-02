class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(reader_list)
    self.readers = reader_list.split(", ").collect { |name| User.find_by(name: name) }
  end

  def visible_to
    self.readers.map do |reader|
      reader.name
    end.join(", ")
  end
end
