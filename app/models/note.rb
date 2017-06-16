class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_readable

  def visible_to=(readers)
    self.readers = readers.split(",").collect do |name|
      User.find_by(name: name.strip)
    end
  end

  def visible_to
    visible_to = self.readers.collect do |u|
      u.name
    end
    visible_to.join(', ')
  end

  private
  def owner_readable
    if user && !readers.include?(user)
      readers << user
    end
  end
end
