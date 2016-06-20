class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :validate_owner

  def visible_to
    self.readers.collect {|reader| reader.name}.join(', ')
  end

  def visible_to=(users)
    self.readers = users.split(', ').map {|user| User.find_by(name: user) }
  end

  private

  def validate_owner
    # binding.pry
    if !self.readers.include?(user)
      self.readers << user
    end
  end

end 
