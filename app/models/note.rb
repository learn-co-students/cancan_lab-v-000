class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :author_can_read

  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(csv)
    self.readers = csv.split(', ').map{|name| User.find_by(name: name)}
  end

  private

  def author_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
