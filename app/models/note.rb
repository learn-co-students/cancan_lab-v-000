class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  accepts_nested_attributes_for :readers, reject_if: lambda {|attributes| attributes['name'].blank?}

  def visible_to
    self.readers
  end


 def visible_to(readers)

    readers = readers.split(",")
    binding.pry
      readers.each do |reader|
        self.readers << User.find_by(name: reader)
      end

  end

end
