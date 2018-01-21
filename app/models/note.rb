class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_owner_to_reader

  def visible_to= (list)
    self.readers = list.split(',').map {|name| User.find_by(name: name.strip)}.compact
  end

  def visible_to
    readers.collect {|reader| reader.name}.join(', ')
  end

  def add_owner_to_reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
