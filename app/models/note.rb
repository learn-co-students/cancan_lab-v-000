class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
    readers.collect{|r| r.name}.join(', ')
  end

  def visible_to=(list)
    names = list.split(',')
    names.each do |n|
      u = User.find_by(name: n.strip)
      self.readers << u if u
    end
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
