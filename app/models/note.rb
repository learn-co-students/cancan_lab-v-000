class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  # before_save :ensure_owner_can_read

  def visible_to=(names)
    names_array = names.split(", ").collect {|name| name.strip}
    names_array.each do |name|
      self.readers << User.find_or_create_by(name: name)
      self.readers = self.readers.uniq
    end

  end

  def visible_to
    self.readers.collect {|reader| reader.name}.join(", ")
  end

  # def ensure_owner_can_read
  #    if user && !readers.include?(user)
  #      readers << user
  #    end
  #  end

end
