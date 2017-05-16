class Note < ActiveRecord::Base
  has_many :viewers
  belongs_to :user
  before_save :make_owner_reader
  has_many :readers, through: :viewers, source: :user
  def visible_to
    readers.map {|reader| reader.name}.join(', ')
  end
  def make_owner_reader
    if user
      if !readers.include?(user)
          readers << user
      end
    end
  end

  def visible_to=(names)
    names.split(',').each do |name|
      user = User.find_by(name: name.strip)
      readers << user if user
    end
    self.save
  end
end
