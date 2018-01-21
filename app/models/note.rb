class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :visible_to_owner

  def visible_to
    self.readers.collect{ |user| user.name }.join(", ")
  end

  def visible_to=(visible_to)
    self.readers = visible_to.split(",").collect do |username|
      User.find_by(name: username.strip)
    end
  end

  private

  def visible_to_owner
    if self.user && !self.readers.include?(self.user)
      self.readers << self.user
    end
  end

end
