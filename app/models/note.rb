class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  belongs_to :user

  accepts_nested_attributes_for :user

  before_save :writer_should_read

  def visible_to
    visible = []
    self.viewers.each do |a|
      visible << User.find(a.user_id).name
    end
    visible.join(', ')
  end

  def visible_to=(csv)
    csv = csv.split(',')
    self.readers = csv.map do |a|
      User.find_by(name: a.strip)
    end
  end

  private

  def writer_should_read
    if user && !readers.include?(user)
      readers << user
    end
  end

end
