class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  before_save :authorize_user

  def visible_to=(readers)
    self.readers = readers.split(', ').collect {|reader| User.find_or_create_by(name: reader)}
  end

  def visible_to
    self.readers.collect {|reader| reader.name}.join(", ")
  end

  def authorize_user
    readers << user if user && !readers.include?(user)
  end

end
