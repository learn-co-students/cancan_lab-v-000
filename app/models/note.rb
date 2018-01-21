class Note < ActiveRecord::Base
  has_many :viewers
  belongs_to :user
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :readers

  def visible_to
    readers.collect { |reader| reader.name }.join(", ")
    # method that returns a string of user objects that the model
    # is visible to.
  end

  def visible_to=(string)
    string.split(", ").each do |name|
      user = User.find_by(name: name)
      self.readers << user if user && !self.readers.include?(user)
    end
  end

end
