class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(list_of_names)
    list_of_names.split(", ").each do |name|
      user = User.find_or_create_by(name: name)
      self.readers << user 
      self.save
    end
  end

  def visible_to
    self.readers.collect { |reader| reader.name }.join(", ")
  end
end
