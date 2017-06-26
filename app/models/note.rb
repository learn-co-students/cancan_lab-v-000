class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(list)
    new_list = list.split(",").map(&:strip)
    new_list.each do |l|
      self.readers << User.find_by(name: l)
    end
  end

  def visible_to
    self.readers.map(&:name).join(", ")
  end
end
