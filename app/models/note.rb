class Note < ActiveRecord::Base

  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to=(readers)
    readers.split(", ").each do |reader_name|
      reader = User.find_by(name: reader_name)
      self.readers << reader
    end.compact.uniq
  end

  def visible_to
    readers.collect {|reader| reader.name}.join(', ')
  end

  def ensure_owner_can_read
    if user && !readers.include?(user)
      self.readers << user
    end
  end

end
