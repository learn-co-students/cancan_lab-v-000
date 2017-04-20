class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :is_a_reader


  def visible_to
    readers.map {|user| user.name}.join(", ")
  end

  def visible_to=(viewer_list)
    self.readers = viewer_list.split(", ").collect do |viewer_name|
      User.find_by(name: viewer_name.strip)
    end
  end


  private

  def is_a_reader
    if user && !readers.include?(user)
      readers << user
    end
  end

end
