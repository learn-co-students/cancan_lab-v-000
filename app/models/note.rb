class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :set_owner_as_reader

  def visible_to
  end

  def visible_to=(user_list)
  end

private

  def set_owner_as_reader
    self.readers << self.user unless self.readers.include? self.user
  end

end
