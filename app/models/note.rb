class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :visible

  def visible_to
    readers.map{|reader| reader.name}.join(", ")
  end

  def visible_to=(new_user)
    self.readers = new_user.split(',').map do |user|
      User.find_by(name: user.strip)
    end
  end

  def visible
    if user
      readers << user
    end
  end

end