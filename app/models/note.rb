class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers  
  has_many :readers, through: :viewers, source: :user

  before_save :is_reader_able?
  
  def visible_to
    readers.map { |user| user.name }.join(', ')
  end

  def visible_to=(readers)
    self.readers = readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end
  end

  private

  def is_reader_able?
    if user && !readers.include?(user)
      readers << user
    end
  end
end