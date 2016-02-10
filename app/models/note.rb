class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :make_creator_a_reader

  def visible_to
    readers.map { |reader| reader.name }.join(', ')
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(', ').map { |name| User.find_by(name: name) }
  end

  private

  def make_creator_a_reader
    if user && !self.readers.include?(user)
      self.readers << user
    end
  end

end
