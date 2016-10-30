class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  accepts_nested_attributes_for :readers

  def visible_to=(readers_list)
    readers_list.split(", ").each do |reader|
      user = User.find_by(name: reader)
      self.readers << user
    end
  end

  def visible_to
    names = self.readers.collect{|reader| reader.name}
    names.join(", ")
  end

end
