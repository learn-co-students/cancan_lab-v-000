class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  # def visible_to=(names)
  #   names.split(', ').each do |name|
  #     if user = User.find_by(name: name.strip)
  #       viewers.build(user: user)
  #     end
  #   end
  # end

  def visible_to
    readers.pluck(:name).join(', ')
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
