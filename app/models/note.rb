class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :make_sure_owner_can_read

  def visible_to=(new_readers)
    self.readers = new_readers.split(", ").map   {|name| User.find_by(name: name.strip)}
  end

  def visible_to
    readers.collect {|user| user.name}.join(", ")
  end

  private

  def make_sure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
