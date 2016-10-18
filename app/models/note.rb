class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(appoint_reader)
    self.readers = appoint_reader.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end
end
