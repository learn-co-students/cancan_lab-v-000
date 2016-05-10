class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  # better

  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  # def visible_to
  #   readers = []
  #   self.readers.each do |reader|
  #     readers << reader.name
  #   end
  #   readers.join(", ")
  # end

  # def visible_to=(readers)
  #   readers_array = readers.split(/\s*,\s*/)
  #   readers_array.each do |reader|
  #     r = User.find_by(name: reader)
  #       if r
  #         self.readers << r
  #       end
  #   end
  # end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end

end
