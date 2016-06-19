class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :make_owner_reader

  def visible_to
    readers.map(&:name).join(', ')
  end

  def visible_to=(names)
    self.readers = names.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  private

  def make_owner_reader
    if user && !readers.include?(user)
      viewers.build(user: user)
    end
  end
end