class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_author_can_read_own_note

  def visible_to=(users)    
    self.readers = users.gsub(" ","").split(",").map do |user| 
      User.find_by(name: user)
    end
  end

  def visible_to
    readers.map {|reader| reader.name}.join(", ")
  end

  private

  def ensure_author_can_read_own_note
    if user && !readers.include?(user)
      readers << user
    end
  end
end
