class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :set_user_as_reader


  def visible_to= names_list
    self.readers = User.find_by_names names_list
  end

  def visible_to
    readers.inject( [] ) do |memo, reader|
      memo << reader.name
    end.join(', ')
  end

  private
  def set_user_as_reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
