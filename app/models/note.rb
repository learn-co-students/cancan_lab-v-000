class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.readers.collect {|user| user.name }.join(', ')
  end

  def visible_to=(new_readers)
    new_readers.split(', ').each do |name|
      self.readers << User.find_by(name: name.strip)
    end
  end

end
