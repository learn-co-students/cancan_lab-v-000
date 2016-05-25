class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  accepts_nested_attributes_for :readers

  def visible_to
    readers.map { |u| u.name }.join(', ')
  end



  def visible_to=(readers)
      self.readers = readers.split(',').map do |name|
        User.find_by(name: name.strip)
      end
  end

end
