class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :add_owner_to_readers

  def visible_to=(names)
    self.readers = names.split(", ").collect { |name| User.find_by(name: name) }
  end

  def visible_to
    self.readers.map { |reader| reader.name }.join(", ")
  end

  private

  def add_owner_to_readers
    if user && !readers.include?(user)
      readers << user
    end
  end

end
