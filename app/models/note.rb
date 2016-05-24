class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  accepts_nested_attributes_for :readers

  def visible_to
    return unless !readers.empty?
    self.readers
  end


 def visible_to=(readers)

    return unless !readers.empty?
    readers = readers.split(",")
      readers.each do |reader|
        self.readers << User.find_by(name: reader) if User.exists?(name: reader)
      end


  end

end
