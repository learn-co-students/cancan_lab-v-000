class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(list)
    self.readers.clear
    list.split(", ").each {|reader| self.readers << User.find_or_create_by(name: reader)}
    #self.readers.each {|x| puts x.name}
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
