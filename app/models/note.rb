class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :give_owner_permission

  def visible_to
    self.readers.collect{|user| user.name}.join(", ")
  end

  def visible_to=(visible_to)
    self.readers = visible_to.split(",").collect do |username|
      User.find_by(name: username.strip)
    end
  end

  private
  def give_owner_permission
    if user && !self.readers.include?(user)
      self.readers << user
    end
  end
end
