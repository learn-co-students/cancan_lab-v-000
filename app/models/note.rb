class Note < ActiveRecord::Base


  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  before_save :add_user_to_readers

  def visible_to=(names)
    names.split(", ").each { |name| self.readers << User.find_by(name: name)}
  end  

  def visible_to
    readers.map { |reader| reader.name }.join(", ")
  end  


  private

  def add_user_to_readers
    if !readers.include?(user)
      readers << user
    end
  end

end
