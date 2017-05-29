class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.collect do |user|
      user.name
    end.join(', ')
  end

  def visible_to=(string)
    self.readers = string.split(',').collect do |name|
      User.find_or_create_by(name: name.strip)
    end
  end

  def add_owner_to_readers(current_user)
    if !readers.include?(current_user)
      readers << current_user
    end
  end

  
end
