class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(names)
    names_array = names.split(", ").collect {|name| name.strip}
    names_array.each do |name|
      self.readers << User.find_or_create_by(name: name)
    end

  end

  def visible_to
    self.readers.collect {|reader| reader.name}.join(", ")
  end

end
