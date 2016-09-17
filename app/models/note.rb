require 'pry'
class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  def visible_to=(comma_separated_readers)
    comma_separated_readers.split(', ').each do |reader_name|
      reader = User.find_or_create_by(name: reader_name)
    	self.readers << reader
    end
  end

  def visible_to
    self.readers.map { |reader| reader.name }.join(", ")
  end
end
