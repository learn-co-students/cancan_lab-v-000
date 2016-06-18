class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.collect {|reader| reader.name}.join(', ')
  end

  def visible_to=(users)
    readers << users.split(', ').map {|user| User.find_by(name: user) }
  end
end
