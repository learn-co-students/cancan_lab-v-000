class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  accepts_nested_attributes_for :readers

  def visible_to=(names)
    names.split(",").each do |name|
      user = User.find_or_create_by(name: name.strip)
      Viewer.create(user_id: user.id, note_id: self.id).save
      self.readers << user unless self.readers.include?(user)
    end
  end

  def visible_to
    self.readers.collect { |reader| reader.name }.sort.join(", ")
  end
end
