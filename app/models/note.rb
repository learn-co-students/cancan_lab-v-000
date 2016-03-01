class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, :through => :viewers, source: :user
  before_save :make_readable

  def visible_to
    self.readers.map { |reader| reader.name }.join(', ')
  end

  def visible_to=(reader_names)
    self.readers = reader_names.split(',').map { |name| User.find_by(name: name.strip)}.compact
  end

  private

  def make_readable
    if user && !readers.include?(user)
      readers << user
    end
  end


end



