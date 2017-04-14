class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :set_owner_as_reader

  def visible_to
    self.readers.collect { |r| r.name }.join(', ')
  end

  def visible_to=(user_list)
    user_list.split(', ').each { |username|
      reader_user = User.find_by(name: username)
      if !reader_user.nil?
        self.readers << reader_user unless self.readers.include? reader_user
      end
    }
  end

private

  def set_owner_as_reader
    self.readers << self.user unless self.readers.include? self.user
  end

end
