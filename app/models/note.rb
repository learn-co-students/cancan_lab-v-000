class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
    readers.map { |r| r.name }.join(', ')
  end  

  def visible_to=(names)
    self.readers = names.split(',').map do |reader|
      User.find_by(name: reader.strip)
    end.compact
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end  
end
