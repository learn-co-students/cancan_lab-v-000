class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_create :validate_owner

  def visible_to
    readers.collect {|reader| reader.name}.join(', ')
  end

  def visible_to=(users)
    readers << users.split(', ').map {|user| User.find_by(name: user) }
    readers.sort
  end

  private

  def validate_owner
    # binding.pry
    if !readers.include?(user)
      readers << user
    end
    # readers.sort_by &:id
  end
end 
