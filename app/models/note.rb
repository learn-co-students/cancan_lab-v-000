class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  accepts_nested_attributes_for :readers

  def visible_to=(lists)
    self.readers = lists.split(',').collect do |name|
      User.find_or_create_by(name: name.strip)
    end
  end

  def visible_to
    self.readers.collect do |reader|
      reader.name
    end.join(', ')
  end


end
