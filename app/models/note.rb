class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :user_eq_reader?

  def visible_to=(viewer_list)
    self.readers = viewer_list.split(", ").map do |viewer_name|
      User.find_by(name: viewer_name.strip)
    end
  end

  def visible_to
    self.save
    readers.pluck(:name).join(', ')
  end

  private

  def user_eq_reader?
    if user && !readers.include?(user)
      readers << user
    end
  end

end
