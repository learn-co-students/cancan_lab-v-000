class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(user)
    self.readers = user.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end
end
