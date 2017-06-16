class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.readers.map { |reader| reader.name }.join(', ')
  end

  def visible_to=(names)
    self.readers = names.split(',').map { |name| User.find_by(name: name.strip) }.compact
  end
end
